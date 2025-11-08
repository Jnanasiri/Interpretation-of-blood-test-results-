# 🩸 Blood Report Management System

A full-stack web application for managing patient blood test reports with barcode scanning, PDF uploads, and comprehensive report management.

## 📋 Table of Contents
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Screenshots](#screenshots)

## ✨ Features

### Core Functionality
- **📷 Barcode Scanner**: Use webcam to scan patient barcodes with auto-fill capability
- **📝 Add Patient Reports**: Comprehensive form with all medical test details
- **📊 View All Reports**: Display reports in a searchable, filterable table
- **🔍 Search & Filter**: Find reports by barcode, name, or test type
- **📄 PDF Upload**: Upload and store patient lab reports
- **🗑️ Delete Reports**: Remove outdated or incorrect reports
- **📈 Statistics Dashboard**: View summary statistics of all reports

### Medical Data Fields
- Patient Information (Name, Age, Gender, Barcode)
- Test Types (CBC, Lipid Profile, Liver Function, Thyroid, etc.)
- Lab Values (Hemoglobin, WBC Count, Platelet Count)
- Diagnosis Summary
- PDF Report Storage

## 🛠️ Technology Stack

### Frontend
- **React 18** - UI Library
- **Vite** - Build tool and dev server
- **TailwindCSS** - Utility-first CSS framework
- **React Router** - Client-side routing
- **html5-qrcode** - Barcode/QR code scanning
- **Axios** - HTTP client

### Backend
- **Node.js** - Runtime environment
- **Express.js** - Web framework
- **MongoDB** - NoSQL database
- **Mongoose** - ODM for MongoDB
- **Multer** - File upload handling
- **CORS** - Cross-origin resource sharing
- **dotenv** - Environment configuration

## 📁 Project Structure

```
blood-report-system/
├── frontend/                      # React Frontend
│   ├── src/
│   │   ├── pages/
│   │   │   ├── Home.jsx          # Landing page with navigation
│   │   │   ├── ScanBarcode.jsx   # Barcode scanner page
│   │   │   ├── AddReport.jsx     # Add new report form
│   │   │   └── ViewReports.jsx   # View all reports with search
│   │   ├── services/
│   │   │   └── api.js            # API service functions
│   │   ├── App.jsx               # Main app component
│   │   ├── main.jsx              # Entry point
│   │   └── index.css             # Global styles
│   ├── index.html
│   ├── package.json
│   ├── vite.config.js
│   └── tailwind.config.js
│
├── backend/                       # Node.js Backend
│   ├── config/
│   │   └── db.js                 # MongoDB connection
│   ├── models/
│   │   └── Report.js             # Mongoose schema
│   ├── routes/
│   │   └── reportRoutes.js       # API routes
│   ├── middleware/
│   │   └── upload.js             # Multer file upload config
│   ├── utils/
│   │   └── seeder.js             # Database seeder
│   ├── uploads/                  # PDF storage directory
│   ├── server.js                 # Express server
│   ├── package.json
│   └── .env                      # Environment variables
│
└── sample_dataset.json            # Initial seed data
```

## 🚀 Installation

### Prerequisites
- Node.js (v14 or higher)
- MongoDB (local installation or MongoDB Atlas account)
- Modern web browser with webcam support

### Step 1: Clone or Navigate to Project
```bash
cd blood2
```

### Step 2: Set Up Backend

```bash
# Navigate to backend directory
cd backend

# Install dependencies (already done)
npm install

# Configure environment variables
# Edit .env file with your MongoDB URI
# Default: mongodb://localhost:27017/blood-report-db
```

### Step 3: Set Up Frontend

```bash
# Navigate to frontend directory
cd ../frontend

# Install dependencies (already done)
npm install
```

### Step 4: Start MongoDB

**Option A: Local MongoDB**
```bash
# Start MongoDB service
mongod
```

**Option B: MongoDB Atlas**
- Create a free cluster at [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)
- Get your connection string
- Update `backend/.env` with your Atlas URI:
  ```
  MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/blood-report-db
  ```

## 🎯 Usage

### Starting the Application

**Terminal 1 - Start Backend Server:**
```bash
cd backend
npm start
```
Backend will run on: `http://localhost:5000`

**Terminal 2 - Start Frontend Dev Server:**
```bash
cd frontend
npm run dev
```
Frontend will run on: `http://localhost:3000`

### Using the Application

1. **Home Page** (`/`)
   - Welcome screen with three main options
   - Navigate to Scan, Add Report, or View Reports

2. **Scan Barcode** (`/scan`)
   - Click "Start Camera Scanner"
   - Allow camera permissions
   - Point camera at barcode
   - Auto-scanned barcode can be used in Add Report form

3. **Add Report** (`/add-report`)
   - Fill in patient details
   - Select test type
   - Enter lab values
   - Upload PDF report (optional)
   - Submit to save

4. **View Reports** (`/view-reports`)
   - Browse all reports in table format
   - Use search bar to filter by barcode, name, or test type
   - Download PDF reports
   - Delete reports
   - View statistics summary

## 🔌 API Endpoints

### Base URL: `http://localhost:5000/api/reports`

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/reports` | Get all reports (optional `?search=query`) |
| GET | `/api/reports/:barcode` | Get specific report by barcode |
| POST | `/api/reports` | Add new report (multipart/form-data) |
| DELETE | `/api/reports/:barcode` | Delete report by barcode |

### Example Request - Add Report
```bash
POST /api/reports
Content-Type: multipart/form-data

{
  "barcode": "B006",
  "name": "John Doe",
  "age": 45,
  "gender": "Male",
  "testType": "Complete Blood Count (CBC)",
  "hemoglobin": 14.5,
  "wbcCount": 7500,
  "plateletCount": 250000,
  "diagnosis": "Normal blood profile",
  "reportFile": [PDF file]
}
```

### Example Response
```json
{
  "success": true,
  "data": {
    "_id": "...",
    "barcode": "B006",
    "name": "John Doe",
    "age": 45,
    "gender": "Male",
    "testType": "Complete Blood Count (CBC)",
    "hemoglobin": 14.5,
    "wbcCount": 7500,
    "plateletCount": 250000,
    "diagnosis": "Normal blood profile",
    "reportFile": "/uploads/reportFile-1234567890.pdf",
    "createdAt": "2025-10-28T..."
  }
}
```

## 📊 Sample Dataset

The application includes 5 realistic sample records that are automatically seeded on first run:

- **B001** - Arun Kumar (34, Male) - CBC - Normal
- **B002** - Divya Ramesh (29, Female) - Liver Function - Elevated ALT
- **B003** - Rahul Sharma (46, Male) - Lipid Profile - High LDL
- **B004** - Meera Joseph (52, Female) - Thyroid - Hypothyroidism
- **B005** - Vikram Singh (39, Male) - Diabetic Screening - Elevated glucose

## 🎨 UI Features

- **Responsive Design**: Works on desktop, tablet, and mobile
- **Color-Coded Values**: Normal/abnormal lab values highlighted
- **Real-time Search**: Instant filtering as you type
- **Modern Gradient Backgrounds**: Beautiful UI with TailwindCSS
- **Loading States**: User feedback during operations
- **Error Handling**: Comprehensive error messages
- **Success Notifications**: Confirmation messages for actions

## 🔒 Environment Variables

Create a `.env` file in the `backend` directory:

```env
PORT=5000
MONGODB_URI=mongodb://localhost:27017/blood-report-db
```

## 🐛 Troubleshooting

### MongoDB Connection Issues
- Ensure MongoDB is running
- Check connection string in `.env`
- Verify network access (for MongoDB Atlas)

### Camera Not Working
- Grant camera permissions in browser
- Use HTTPS or localhost
- Check browser compatibility

### File Upload Errors
- Ensure `uploads/` directory exists
- Check file size limits (10MB max)
- Only PDF files are accepted

## 📝 Notes

- The barcode scanner requires HTTPS or localhost
- PDF files are stored in `backend/uploads/` directory
- Database is automatically seeded with sample data on first run
- All timestamps are in ISO format

## 🚀 Future Enhancements

- User authentication and authorization
- Report editing functionality
- Export reports to CSV/Excel
- Email notifications
- Advanced analytics and charts
- Multi-language support
- Print report functionality
- Report history tracking

## 📄 License

MIT License - Feel free to use this project for learning and development.

---

**Built with ❤️ using React, Node.js, and MongoDB**
