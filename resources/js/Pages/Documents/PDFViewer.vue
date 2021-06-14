<template>
  <div id="pageContainer">
    <!-- <div id="viewer" class="pdfViewer"></div> -->
    <!-- <canvas id="the-canvas"></canvas> -->
    <div id="container" />
  </div>
</template>

<script>
import pdfjsLib from 'pdfjs-dist/build/pdf'
import 'pdfjs-dist/web/pdf_viewer.css'
import Layout from '@/Shared/Layout'


pdfjsLib.GlobalWorkerOptions.workerSrc =
  'https://cdn.jsdelivr.net/npm/pdfjs-dist@2.0.943/build/pdf.worker.min.js'


export default {
  name: 'PdfViewer',
  layout:Layout,
  props: {
    doc: Object,
  },
  mounted() { 
    this.getPdf()
  },
  methods: {
    async getPdf() {
      /*let container = document.getElementById("pageContainer");
      let pdfViewer = new PDFViewer({
        container: container
      });*/
      let loadingTask = pdfjsLib.getDocument(this.doc.filePdf)
      /*let pdf = await loadingTask.promise;
      pdfViewer.setDocument(pdf);*/

      /*loadingTask
      .then(function(pdf) {
        return pdf.getPage(1);
      })
      .then(function(page) {
        // Set scale (zoom) level
        var scale = 1.5;

        // Get viewport (dimensions)
        var viewport = page.getViewport(scale);

        // Get canvas#the-canvas
        var canvas = document.getElementById('the-canvas');

        // Fetch canvas' 2d context
        var context = canvas.getContext('2d');

        // Set dimensions to Canvas
        canvas.height = viewport.height;
        canvas.width = viewport.width;

        // Prepare object needed by render method
        var renderContext = {
          canvasContext: context,
          viewport: viewport
        };

        // Render PDF page
        page.render(renderContext);
      });*/
      
      loadingTask
        .then(function(pdf) {
        // Get div#container and cache it for later use
          var container = document.getElementById('container')

          // Loop from 1 to total_number_of_pages in PDF document
          for (var i = 1; i <= 10; i++) {
            // Get desired page
            pdf.getPage(i).then(function(page) {

              // var scale = 1.5
              var viewport = page.getViewport(0.95)
              var div = document.createElement('div')
              var scale = container.clientWidth / viewport.width
              viewport = page.getViewport(scale)

              // Set id attribute with page-#{pdf_page_number} format
              div.setAttribute('id', 'page-' + (page.pageIndex + 1))

              // This will keep positions of child elements as per our needs
              div.setAttribute('style', 'position: relative')

              // Append div within div#container
              container.appendChild(div)

              // Create a new Canvas element
              var canvas = document.createElement('canvas')

              // Append Canvas within div#page-#{pdf_page_number}
              div.appendChild(canvas)
              div.appendChild(document.createElement('br'))

              var context = canvas.getContext('2d')
              canvas.height = viewport.height
              canvas.width = viewport.width

              var renderContext = {
                canvasContext: context,
                viewport: viewport,
              }

              // Render PDF page
              page.render(renderContext)
            })
          }
        })
    },
  },
}
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