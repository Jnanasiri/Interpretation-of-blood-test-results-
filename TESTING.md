# 🧪 Testing Guide - Blood Report Management System

## ✅ Pre-Test Checklist

Before testing, ensure:
- [ ] Backend server is running (Port 5001)
- [ ] Frontend server is running (Port 3000)
- [ ] MongoDB is running and connected
- [ ] Browser is open to http://localhost:3000

---

## 🎯 Test Scenarios

### Test 1: View Pre-loaded Sample Data ✅

**Objective:** Verify database seeding and data display

**Steps:**
1. Open http://localhost:3000
2. Click "View Reports" button
3. Verify you see 5 sample reports

**Expected Results:**
- Table displays 5 patient records
- Data includes: B001-B005 barcodes
- Names: Arun Kumar, Divya Ramesh, Rahul Sharma, Meera Joseph, Vikram Singh
- All columns populated (Age, Gender, Test Type, etc.)
- Color-coded lab values (green/yellow badges)
- Statistics shown at bottom (Total: 5, Average Hemoglobin, Gender counts)

**Pass Criteria:** ✅ All 5 records display correctly with proper formatting

---

### Test 2: Search Functionality ✅

**Objective:** Test search and filter capabilities

**Steps:**
1. In "View Reports" page
2. Type "Arun" in search box
3. Verify filtered results
4. Clear search, type "B001"
5. Verify filtered results
6. Clear search, type "CBC"
7. Verify filtered results

**Expected Results:**
- Search for "Arun" → Shows 1 result (Arun Kumar)
- Search for "B001" → Shows 1 result (B001)
- Search for "CBC" → Shows 1 result (CBC test type)
- "Found X report(s)" count updates in real-time
- Table updates instantly without page refresh

**Pass Criteria:** ✅ Search filters correctly by name, barcode, and test type

---

### Test 3: Add New Report (Without PDF) ✅

**Objective:** Test form submission and data persistence

**Steps:**
1. Click "Add Report" from home page
2. Fill in form:
   - Barcode: `B006`
   - Name: `Test Patient`
   - Age: `40`
   - Gender: `Male`
   - Test Type: `Complete Blood Count (CBC)`
   - Hemoglobin: `14.5`
   - WBC Count: `7500`
   - Platelet Count: `250000`
   - Diagnosis: `Normal blood test results`
3. Leave PDF upload empty
4. Click "Add Report"

**Expected Results:**
- Success message appears: "Report added successfully!"
- Automatic redirect to View Reports page after 2 seconds
- New report appears in the table
- Barcode B006 is visible
- "No file" shown in Report column
- Statistics update (Total: 6)

**Pass Criteria:** ✅ Report added successfully and appears in database

---

### Test 4: Add New Report (With PDF) ✅

**Objective:** Test file upload functionality

**Steps:**
1. Create a test PDF file (any PDF)
2. Click "Add Report"
3. Fill in form:
   - Barcode: `B007`
   - Name: `PDF Test Patient`
   - Age: `35`
   - Gender: `Female`
   - Test Type: `Liver Function Test`
   - Hemoglobin: `12.8`
   - WBC Count: `6900`
   - Platelet Count: `260000`
   - Diagnosis: `Test with PDF attachment`
4. Upload PDF file
5. Verify file name appears: "✓ filename.pdf"
6. Click "Add Report"

**Expected Results:**
- File upload shows green checkmark with filename
- Success message appears
- Report added to database
- In View Reports, "📄 Download" link appears
- Clicking download link opens/downloads the PDF
- File stored in backend/uploads/ folder

**Pass Criteria:** ✅ PDF upload works and download link is functional

---

### Test 5: Duplicate Barcode Validation ✅

**Objective:** Test unique barcode constraint

**Steps:**
1. Click "Add Report"
2. Enter barcode: `B001` (already exists)
3. Fill other fields
4. Submit form

**Expected Results:**
- Error message: "Report with this barcode already exists"
- Form not submitted
- Red error banner appears
- User remains on Add Report page

**Pass Criteria:** ✅ System prevents duplicate barcodes

---

### Test 6: Form Validation ✅

**Objective:** Test required field validation

**Steps:**
1. Click "Add Report"
2. Leave Barcode field empty
3. Try to submit form
4. Fill Barcode, leave Name empty
5. Try to submit form

**Expected Results:**
- Browser validation prevents submission
- Required fields marked with red asterisk
- HTML5 validation messages appear
- Form cannot be submitted until all required fields filled

**Pass Criteria:** ✅ All required fields validated before submission

---

### Test 7: Barcode Scanner ✅

**Objective:** Test webcam barcode scanning

**Steps:**
1. Click "Scan Barcode" from home
2. Click "Start Camera Scanner"
3. Allow camera permissions
4. Position a barcode/QR code in view
5. Wait for automatic scan
6. Click "Proceed to Add Report"

**Expected Results:**
- Camera permission dialog appears
- Webcam video feed displays
- Scanner box visible on screen
- Barcode detected automatically
- Success message: "Barcode Scanned Successfully!"
- Scanned barcode displayed in large font
- Clicking "Proceed" navigates to Add Report
- Barcode field auto-filled with scanned value

**Pass Criteria:** ✅ Barcode scanner detects codes and auto-fills form

**Note:** If no barcode available, use online barcode generator or QR code

---

### Test 8: Delete Report ✅

**Objective:** Test report deletion

**Steps:**
1. Go to "View Reports"
2. Find report B006 (or any test report)
3. Click "Delete" button
4. Confirm deletion in dialog

**Expected Results:**
- Confirmation dialog appears
- After confirming, success message shows
- Report removed from table
- Statistics update (count decreases)
- Database record deleted

**Pass Criteria:** ✅ Report successfully deleted from database and UI

---

### Test 9: Navigation & Routing ✅

**Objective:** Test all page navigation

**Steps:**
1. Start at home page (/)
2. Click "Scan Barcode" → Verify page loads
3. Click "← Back to Home" → Return to home
4. Click "Add Report" → Verify page loads
5. Click "📷 Scan Barcode" → Navigate to scan page
6. Click "← Home" → Return to home
7. Click "View Reports" → Verify page loads
8. Click "+ Add Report" → Navigate to add page
9. Click "View All Reports" → Navigate to view page

**Expected Results:**
- All navigation buttons work
- URLs update correctly
- No broken links
- Smooth page transitions
- No console errors

**Pass Criteria:** ✅ All navigation works without errors

---

### Test 10: Responsive Design ✅

**Objective:** Test mobile/tablet responsiveness

**Steps:**
1. Open browser DevTools (F12)
2. Toggle device toolbar
3. Test different screen sizes:
   - Mobile: 375px width
   - Tablet: 768px width
   - Desktop: 1920px width
4. Navigate through all pages

**Expected Results:**
- Layout adapts to screen size
- Table scrolls horizontally on mobile
- Buttons stack vertically on small screens
- Text remains readable
- No horizontal overflow
- Touch-friendly button sizes

**Pass Criteria:** ✅ UI is responsive across all device sizes

---

### Test 11: API Endpoints (Direct Testing) ✅

**Objective:** Test REST API directly

**Using Browser or Postman:**

**GET All Reports:**
```
GET http://localhost:5001/api/reports
```
Expected: JSON array with all reports

**GET Specific Report:**
```
GET http://localhost:5001/api/reports/B001
```
Expected: JSON object with B001 report

**Search Reports:**
```
GET http://localhost:5001/api/reports?search=Arun
```
Expected: Filtered JSON array

**POST New Report (Postman):**
```
POST http://localhost:5001/api/reports
Content-Type: multipart/form-data

Body:
- barcode: B999
- name: API Test
- age: 30
- gender: Male
- testType: Complete Blood Count (CBC)
- hemoglobin: 14.0
- wbcCount: 7000
- plateletCount: 240000
- diagnosis: API test entry
```
Expected: 201 status, JSON with new report

**DELETE Report:**
```
DELETE http://localhost:5001/api/reports/B999
```
Expected: 200 status, success message

**Pass Criteria:** ✅ All API endpoints respond correctly

---

### Test 12: Error Handling ✅

**Objective:** Test error scenarios

**Test A: Backend Down**
1. Stop backend server
2. Try to view reports in frontend
Expected: Error message displayed

**Test B: Invalid File Type**
1. Try uploading .txt or .jpg file
Expected: "Please select a PDF file" error

**Test C: Network Error**
1. Disconnect internet (for Atlas)
Expected: MongoDB connection error

**Test D: Invalid Data**
1. Enter negative age
Expected: Validation prevents submission

**Pass Criteria:** ✅ All errors handled gracefully with user feedback

---

## 📊 Test Results Summary

After completing all tests, fill this out:

| Test # | Test Name | Status | Notes |
|--------|-----------|--------|-------|
| 1 | View Sample Data | ⬜ PASS / ⬜ FAIL | |
| 2 | Search Function | ⬜ PASS / ⬜ FAIL | |
| 3 | Add Report (No PDF) | ⬜ PASS / ⬜ FAIL | |
| 4 | Add Report (With PDF) | ⬜ PASS / ⬜ FAIL | |
| 5 | Duplicate Barcode | ⬜ PASS / ⬜ FAIL | |
| 6 | Form Validation | ⬜ PASS / ⬜ FAIL | |
| 7 | Barcode Scanner | ⬜ PASS / ⬜ FAIL | |
| 8 | Delete Report | ⬜ PASS / ⬜ FAIL | |
| 9 | Navigation | ⬜ PASS / ⬜ FAIL | |
| 10 | Responsive Design | ⬜ PASS / ⬜ FAIL | |
| 11 | API Endpoints | ⬜ PASS / ⬜ FAIL | |
| 12 | Error Handling | ⬜ PASS / ⬜ FAIL | |

---

## 🐛 Common Issues & Solutions

### Issue: Camera not working
**Solution:** 
- Use HTTPS or localhost
- Grant camera permissions
- Try Chrome/Firefox
- Check if camera is being used by another app

### Issue: Reports not showing
**Solution:**
- Check backend console for errors
- Verify MongoDB is running
- Check browser console for API errors
- Refresh page

### Issue: File upload fails
**Solution:**
- Check file is PDF format
- File size under 10MB
- Check uploads/ folder permissions
- Verify Multer middleware configured

### Issue: Search not working
**Solution:**
- Check search input value
- Verify reports exist in database
- Check browser console for errors

---

## 🎯 Performance Benchmarks

Expected performance metrics:

- **Page Load:** < 2 seconds
- **API Response:** < 500ms
- **Search Filter:** < 100ms (instant)
- **File Upload:** < 5 seconds (for 5MB PDF)
- **Database Query:** < 100ms

---

## ✅ Final Verification

Before considering testing complete:

- [ ] All 12 tests completed
- [ ] No console errors in browser
- [ ] No errors in backend terminal
- [ ] Database has data
- [ ] All navigation works
- [ ] Search functions properly
- [ ] File upload/download works
- [ ] Statistics display correctly
- [ ] Responsive on mobile
- [ ] API endpoints accessible

---

## 📝 Test Report Template

**Date:** ___________  
**Tester:** ___________  
**Browser:** Chrome / Firefox / Edge / Safari  
**OS:** Windows / Mac / Linux  

**Overall Status:** ⬜ PASS / ⬜ FAIL  

**Issues Found:**
1. _________________________________
2. _________________________________
3. _________________________________

**Recommendations:**
1. _________________________________
2. _________________________________

---

## 🚀 Next Steps After Testing

If all tests pass:
1. ✅ Deploy to production server
2. ✅ Configure MongoDB Atlas
3. ✅ Set up SSL/HTTPS
4. ✅ Add authentication
5. ✅ Implement advanced features

If tests fail:
1. 🔍 Document the issue
2. 🐛 Debug the problem
3. 🔧 Fix the code
4. 🧪 Re-test
5. ✅ Verify fix works

---

**Happy Testing! 🧪**
