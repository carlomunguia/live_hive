defmodule PentoWeb.FAQLive.FormComponent do
  use PentoWeb, :live_component

  alias Pento.FrequentlyAskedQuestions

  @impl true
  def update(%{faq: faq} = assigns, socket) do
    changeset = FrequentlyAskedQuestions.change_faq(faq)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"faq" => faq_params}, socket) do
    changeset =
      socket.assigns.faq
      |> FrequentlyAskedQuestions.change_faq(faq_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"faq" => faq_params}, socket) do
    save_faq(socket, socket.assigns.action, faq_params)
  end

  defp save_faq(socket, :edit, faq_params) do
    case FrequentlyAskedQuestions.update_faq(socket.assigns.faq, faq_params) do
      {:ok, _faq} ->
        {:noreply,
         socket
         |> put_flash(:info, "Faq updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_faq(socket, :new, faq_params) do
    case FrequentlyAskedQuestions.create_faq(faq_params) do
      {:ok, _faq} ->
        {:noreply,
         socket
         |> put_flash(:info, "Faq created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
