# Blood Report Management System - Quick Start Guide

## 🎯 Quick Setup (3 Steps)

### Step 1: Ensure MongoDB is Running

**Option A - Local MongoDB:**
```bash
mongod
```

**Option B - MongoDB Atlas (Cloud):**
1. Go to https://www.mongodb.com/cloud/atlas
2. Create free cluster
3. Get connection string
4. Update `backend/.env` with your connection string

### Step 2: Start Backend Server

Open Terminal 1:
```bash
cd backend
npm start
```

You should see:
```
Server is running on port 5000
MongoDB Connected: localhost
Database seeded successfully with sample data
```

### Step 3: Start Frontend

Open Terminal 2:
```bash
cd frontend
npm run dev
```

You should see:
```
VITE ready in XXX ms
Local: http://localhost:3000/
```

## 🌐 Access Application

Open your browser and go to:
```
http://localhost:3000
```

## 🧪 Test the Features

1. **View Sample Data**
   - Click "View Reports" from home
   - You'll see 5 pre-loaded sample reports

2. **Add New Report**
   - Click "Add Report"
   - Fill in the form
   - Barcode: B006
   - Try uploading a PDF file
   - Submit and view in reports list

3. **Search Reports**
   - In View Reports page
   - Type in search box: "Arun" or "B001" or "CBC"
   - See filtered results

4. **Barcode Scanner** (Requires camera)
   - Click "Scan Barcode"
   - Allow camera access
   - Scan any barcode/QR code
   - Barcode auto-fills in Add Report form

## 📊 Sample Data Included

The database is pre-loaded with 5 realistic patient records:
- B001 - Arun Kumar (CBC - Normal)
- B002 - Divya Ramesh (Liver Function)
- B003 - Rahul Sharma (Lipid Profile)
- B004 - Meera Joseph (Thyroid)
- B005 - Vikram Singh (Diabetic Screening)

## 🔧 Common Issues

**MongoDB Connection Error:**
- Make sure MongoDB is running
- Check `backend/.env` file has correct MONGODB_URI

**Port Already in Use:**
- Backend (5000): Stop other apps using port 5000
- Frontend (3000): Stop other apps using port 3000

**Camera Not Working:**
- Browser must be localhost or HTTPS
- Grant camera permissions when prompted
- Try Chrome or Firefox (best compatibility)

## 📱 Browser Requirements

- Chrome 60+ (Recommended)
- Firefox 55+
- Safari 11+
- Edge 79+

## 🎉 You're All Set!

Enjoy using the Blood Report Management System!
