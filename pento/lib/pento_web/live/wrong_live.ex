defmodule PentoWeb.WrongLive do
    use Phoenix.LiveView, layout: {PentoWeb.LayoutView,
    "live.html"}

    def mount(_params, _session, socket) do
        {:ok, assign(socket, score: 0, message: "Make a guess", time: DateTime.utc_now, correct_guess: Enum.random(1..10) |> to_string())}
    end  

    def render(assigns) do
        ~H"""
        <h1>Your score: <%= @score %></h1>
        <h2>
            <%= @message %>
        </h2>
        <h2>
            <%= for n <- 1..10 do %>
            <a href="#" phx-click="guess" phx-value-number= {n} > <%= n %></a>
            <% end %>
        </h2>

        <h2>
            <%= @message %>
            It's <%= @time %>
        </h2>    
        """
    end 

    def handle_event("guess",%{"number" => guess} = data, %{assigns: %{correct_guess: guess}} = socket)
    do   
            winning_message = "Your guess: #{guess} is SUPER CORRECT. WINNER!!!! "
            score = socket.assigns.score + 1
            time = DateTime.utc_now

        {
            :noreply,
            assign(
                socket,
                message: winning_message,
                score: score,
                time: time,
                )}
    end

    def handle_event("guess",%{"number" => guess}=data,%{assigns: %{correct_guess: correct_guess}} = socket)
    do
            losing_message = "Your guess: #{guess}. Wrong. Guess again. "
            score = socket.assigns.score - 1
            time = DateTime.utc_now

        {
            :noreply,
            assign(
                socket,
                message: losing_message,
                score: score,
                time: time,
                )}
    end
                           
end    