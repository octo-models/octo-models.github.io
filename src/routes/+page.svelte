<script>
	import Header from './Header.svelte';
	import Teaser from './Teaser.svelte';
	import { base } from '$app/paths';

	let renderVideos = false;
	function handleShow() {
		setTimeout(() => {
			renderVideos = true;
		}, 1500);
	}
</script>

<Header on:hideTitle={handleShow} />

<div class="bg-gradient-to-b from-white to-white mt-0 w-full flex flex-col items-center">
	<div class="max-w-4xl w-full px-4 pt-4">
		<!-- links -->
		<div class="flex space-x-20 justify-center text-center pt-8 text-lg pb-4">
			<div class="w-16 flex flex-col justify-center">
				<a href="{base}/" class="hover:underline text-black">
					<img src="{base}/documents.svg" alt="documents" />
					Report
				</a>
			</div>
			<div class="w-16 flex flex-col justify-center">
				<a href="https://github.com/kvablack/susie" class="hover:underline text-black">
					<img src="{base}/code.svg" alt="code" />
					Code
				</a>
			</div>
		</div>

		<!-- teaser -->
		<!-- <img src="{base}/teaser.png" alt="teaser" class="w-full" /> -->
	</div>
	<div class="w-full bg-slate-100 px-2 md:px-16 py-8">
		<Teaser {renderVideos} />
	</div>
	<div class="pb-[1000px]" />
</div>
