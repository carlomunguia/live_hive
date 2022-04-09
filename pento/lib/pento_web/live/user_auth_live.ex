defmodule PentoWeb.UserAuthLive do
    import Phoenix.LiveView
    alias Pento.Accounts

    def on_mount(_, params, %{"user_token" => user_token}, socket) do
        user = Accounts.get_user_by_session_token(user_token)
        socket = assign_new(socket, :current_user, fn -> Accounts.get_user!(user.id) end)
        
        if socket.assigns.current_user do
            {:cont, socket}
        else
            {:halt, redirect(socket, to: "/login")}
        end        
    end
end        
