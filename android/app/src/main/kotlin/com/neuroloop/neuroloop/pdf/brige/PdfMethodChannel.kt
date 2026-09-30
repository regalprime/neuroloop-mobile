package com.neuroloop.neuroloop.pdf.brige


import android.content.Context
import com.neuroloop.neuroloop.pdf.extractor.PdfTextExtractor
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

class PdfMethodChannel(
    context: Context,
    messenger: BinaryMessenger,

    ) {
    companion object {
        private const val CHANNEL_NAME = "com.neuroloop.neuroloop.pdf"
        private const val METHOD_EXTRACT_TEXT = "extractText"
    }

    private val scope = CoroutineScope(
        SupervisorJob() + Dispatchers.Main.immediate
    )

    private val extractor = PdfTextExtractor(context)

    private val channel = MethodChannel(
        messenger,
        CHANNEL_NAME,
    )

    init {
        channel.setMethodCallHandler(::handleMethodCall)
    }

    private fun handleMethodCall(
        call: MethodCall,
        result: MethodChannel.Result,
    ) {
        when (call.method) {
            METHOD_EXTRACT_TEXT -> extractText(call, result)

            else -> {
                result.notImplemented()
            }
        }
    }

    private fun extractText(
        call: MethodCall,
        result: MethodChannel.Result,
    ) {
        val path = call.argument<String>("path")

        if (path.isNullOrBlank()) {
            result.error(
                "INVALID_ARGUMENT",
                "PDF path is required.",
                null,
            )
            return
        }

        scope.launch {
            try {
                val text = withContext(Dispatchers.IO) {
                    extractor.extract(path)
                }

                result.success(text)
            } catch (exception: Exception) {
                result.error(
                    "PDF_EXTRACTION_ERROR",
                    exception.message ?: "Failed to extract PDF text.",
                    null,
                )
            }
        }
    }

    fun dispose() {
        channel.setMethodCallHandler(null)
        scope.cancel()
    }

}