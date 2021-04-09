import os
import scribus

if scribus.haveDoc() :
    filename = os.path.dirname(scribus.getDocName())+"/export/"+os.path.basename(scribus.getDocName().split('.')[0])+".pdf"
    pdf = scribus.PDFfile()
    pdf.file = filename
    pdf.save()
else :
    print("No file open")
