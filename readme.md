#a
# bus_T

##Overview
The `bus_T` repository contains the codebase for a bus management application. It is divided into backend and frontend components.

## Folder Structure
- `bus_T_BackEnd/`: Contains the backend code.
- `bus_T_FrontEND/`: Contains the frontend code.

 ## Figma
- used figma to a outline designs of the app interface
- https://www.figma.com/design/k9qA4GGwP1F0xtlrqPEeE7/BUS-T?node-id=0-1&t=NPhRUJeAP3VgDnNg-0
- 

## Backend

### Overview
The backend of the application is built using Node.js and Express, and it uses MongoDB for database management.

### Prerequisites
- Node.js
- npm (Node Package Manager)
- MongoDB

### Installation
1. Navigate to the backend folder:
   ```bash
   cd bus_T_BackEnd
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Configure environment variables:
   - Create a `.env` file in the `bus_T_BackEnd` folder.
   - Add the following variables:
     ```env
     PORT=5000
     MONGO_URI=your_mongodb_connection_string
     ```

### Running the Backend Server
Start the backend server:
```bash
npm start
```

### API Endpoints
The backend provides the following API endpoints:
- **GET /buses**: Retrieve a list of all buses.
- **POST /buses**: Add a new bus.
- **GET /buses/:id**: Retrieve details of a specific bus by ID.
- **PUT /buses/:id**: Update details of a specific bus by ID.
- **DELETE /buses/:id**: Delete a specific bus by ID.

## Frontend

### Overview
The frontend of the application is built using React.

### Prerequisites
- Node.js
- npm (Node Package Manager)

### Installation
1. Navigate to the frontend folder:
   ```bash
   cd bus_T_FrontEND
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

### Running the Frontend Server
Start the frontend server:
```bash
npm start
```

### Project Structure
- `src/`: Contains the source code for the React application.
  - `components/`: Reusable React components.
  - `pages/`: Different pages of the application.
  - `services/`: Services for API calls.
  - `App.js`: Main application component.
  - `index.js`:                                                         Entry point of the React application.

### Available Scripts
In the project directory, you can run:
- `npm start`: Runs the app in the development mode.
- `npm test`: Launches the test runner in the interactive watch mode.
- `npm build`: Builds the app for production to the `build` folder.

## Contributing
Contributions are welcome. Please fork the repository and submit pull requests.

## License
This project is licensed under the MIT License.
