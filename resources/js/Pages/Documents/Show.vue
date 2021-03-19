<template>
	<div>
		{{currentPage}} / {{pageCount}}
		<pdf
			src="doc.filePdf"
			@num-pages="pageCount = $event"
			@page-loaded="currentPage = $event"
		></pdf>
	</div>
</template>

<script>

import pdf from 'vue-pdf'
import Layout from '@/Shared/Layout'

export default {
	components: {
		pdf
	},
	layout: Layout,
	  props: {
	    doc: Object,
	  },
	data() {
		return {
			currentPage: 0,
			pageCount: 0,
		}
	}
}

</script>