<template>
  <div id="pageContainer">
    <div id="viewer" class="pdfViewer"></div>
  </div>
</template>

<script>
import pdfjsLib from "pdfjs-dist/build/pdf";
import { PDFViewer } from "pdfjs-dist/web/pdf_viewer";
import "pdfjs-dist/web/pdf_viewer.css";
import Icon from '@/Shared/Icon'
import Layout from '@/Shared/Layout'


pdfjsLib.GlobalWorkerOptions.workerSrc =
  "https://cdn.jsdelivr.net/npm/pdfjs-dist@2.0.943/build/pdf.worker.min.js";


export default {
  name: "PdfViewer",
  mounted() {
    this.getPdf();
  },
  components: {
    Icon
  },
  layout:Layout,
  props: {
    doc: Object,
  },
  methods: {
    async getPdf() {
      let container = document.getElementById("pageContainer");
      let pdfViewer = new PDFViewer({
        container: container
      });
      let loadingTask = pdfjsLib.getDocument(this.doc.filePdf);
      let pdf = await loadingTask.promise;
      pdfViewer.setDocument(pdf);
    }
  }
};
</script>

<style>
#pageContainer {
  margin: auto;
  width: 80%;
}

div.page {
  display: inline-block;
}
</style>