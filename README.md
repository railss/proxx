
<img width="824" alt="Screenshot 2024-07-23 at 17 10 59" src="https://github.com/user-attachments/assets/67077f84-9d7e-4d6f-ab1c-b6b34a4eb531">

I have developed a Minesweeper-like game called "PROXX". The development process involved several key steps and approaches to ensure the game is both functional and maintainable:

CQRS Pattern: I structured the application using the Command Query Responsibility Segregation (CQRS) pattern. This approach separates the commands that change state from the queries that read state, making the codebase easier to manage and understand.

Modular Design: The application is split into distinct modules, including commands, queries, models, game_master, game_loop, ui, and validator. This modular design enhances readability and maintainability.

Input Validation: I implemented comprehensive input validation to ensure that user inputs for board size, number of black holes, and cell coordinates are handled gracefully. This helps prevent errors and improves the robustness of the game.

RSpec Testing: The application is thoroughly tested using RSpec. Each module has corresponding test files to ensure the correctness of the game logic and functionalities. This includes mocking user inputs for seamless test execution.

User-Friendly Interface: The UI module is designed to provide clear and consistent messages to the user, including prompts, error messages, and game status updates. This ensures a smooth and intuitive user experience.

By following these approaches, the codebase remains clean, modular, and easy to extend in the future. The tests provide confidence in the stability of the game, making it easier to maintain and enhance.
