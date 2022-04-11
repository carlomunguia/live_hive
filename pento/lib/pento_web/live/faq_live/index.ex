defmodule PentoWeb.FAQLive.Index do
  use PentoWeb, :live_view

  alias Pento.FrequentlyAskedQuestions
  alias Pento.FrequentlyAskedQuestions.FAQ

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :faqs, list_faqs())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Faq")
    |> assign(:faq, FrequentlyAskedQuestions.get_faq!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Faq")
    |> assign(:faq, %FAQ{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Faqs")
    |> assign(:faq, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    faq = FrequentlyAskedQuestions.get_faq!(id)
    {:ok, _} = FrequentlyAskedQuestions.delete_faq(faq)

    {:noreply, assign(socket, :faqs, list_faqs())}
  end

  defp list_faqs do
    FrequentlyAskedQuestions.list_faqs()
  end
end
