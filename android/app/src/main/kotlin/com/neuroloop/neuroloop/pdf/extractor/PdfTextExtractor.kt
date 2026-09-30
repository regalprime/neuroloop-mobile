package com.neuroloop.neuroloop.pdf.extractor

import android.content.Context
import com.tom_roush.pdfbox.android.PDFBoxResourceLoader
import com.tom_roush.pdfbox.pdmodel.PDDocument
import com.tom_roush.pdfbox.text.PDFTextStripper
import java.io.File

class PdfTextExtractor(
    private val context: Context,
) {
    init {
        PDFBoxResourceLoader.init(context.applicationContext)
    }

    fun extract(path: String): String {
        val file = File(path)

        require(file.exists()) {
            "PDF file does not exist: $path"
        }

        require(file.isFile) {
            "PDF path is not a file: $path"
        }

        PDDocument.load(file).use { document ->
            val stripper = PDFTextStripper()

            return stripper.getText(document)

        }
    }
}