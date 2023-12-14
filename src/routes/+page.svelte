<script>
	import Header from './Header.svelte';
	import VideoCarousel from './VideoCarousel.svelte';
	import { base } from '$app/paths';
	import Octo from './Octo.svelte';

	let renderVideos = false;
	function handleShow() {
		setTimeout(() => {
			renderVideos = true;
		}, 1500);
	}
</script>

<Header on:hideTitle={handleShow} />

<!-- content column -->
<div class="max-w-4xl w-full px-2 pt-4 flex flex-col items-center mx-auto">
	<!-- authors -->
	<div class="flex flex-col items-center text-xl">
		<span class="font-bold">Octo Model Team</span>
		<div
			class="flex justify-center flex-wrap mt-2 underline decoration-dotted decoration-blue-500 underline-offset-2"
		>
			<span class="px-2"> Dibya Ghosh<sup>1</sup> </span>
			<span class="px-2"> Homer Walke<sup>1</sup> </span>
			<span class="px-2"> Karl Pertsch<sup>1,2</sup> </span>
			<span class="px-2"> Kevin Black<sup>1</sup> </span>
			<span class="px-2"> Oier Mees<sup>1</sup> </span>
		</div>
		<div
			class="flex justify-center flex-wrap mt-2 underline decoration-dotted decoration-amber-500 underline-offset-2"
		>
			<span class="px-2">Sudeep Dasari<sup>3</sup></span>
			<span class="px-2">Joey Hejna<sup>2</sup></span>
			<span class="px-2">Charles Xu<sup>1</sup></span>
			<span class="px-2">Jianlan Luo<sup>1</sup></span>
			<span class="px-2">Tobias Kreiman<sup>1</sup></span>
			<span class="px-2">You Liang Tan<sup>1</sup></span>
		</div>
		<div
			class="flex justify-center flex-wrap mt-2 underline decoration-dotted decoration-green-500 underline-offset-2"
		>
			<span class="px-2">Dorsa Sadigh<sup>2</sup></span>
			<span class="px-2">Chelsea Finn<sup>2</sup></span>
			<span class="px-2">Sergey Levine<sup>1</sup></span>
		</div>
		<div class="flex justify-center flex-wrap mt-4">
			<span class="px-4">1. UC Berkeley</span>
			<span class="px-4">2. Stanford University</span>
			<span class="px-4">3. Carnegie Mellon University</span>
		</div>
	</div>

	<!-- links -->
	<div class="flex space-x-20 justify-center text-center pt-4 text-lg pb-4">
		<div class="flex flex-col justify-center hover:bg-sky-200 rounded-md">
			<a href="{base}/" class="hover:underline text-black p-4 flex flex-col items-center">
				<img src="{base}/documents.svg" alt="documents" class="w-16" />
				Report
			</a>
		</div>
		<div class="flex flex-col justify-center hover:bg-sky-200 rounded-md">
			<a
				href="https://github.com/octo-models/octo"
				class="hover:underline text-black p-4 flex flex-col items-center"
			>
				<img src="{base}/github-mark.svg" alt="code" class="w-16" />
				Code
			</a>
		</div>
	</div>
</div>

<!-- full-width video carousel -->
<div class="w-full bg-slate-100 px-2 md:px-16 py-8">
	<VideoCarousel {renderVideos} />
</div>

<!-- content column again -->
<div class="max-w-6xl w-full px-2 pt-4 flex flex-col items-center mx-auto">
	<p class="mt-8 text-l">
		We introduce <Octo />, our ongoing effort for building open-source, widely applicable generalist
		policies for robotic manipulation. The Octo model is a transformer-based diffusion policy,
		pretrained on 800k robot episodes from the
		<a href="https://robotics-transformer-x.github.io/">Open X-Embodiment dataset</a>. It supports
		flexible task and observation definitions and can be quickly finetuned to new observation and
		action spaces.
	</p>
	<img src="{base}/teaser.png" alt="teaser" class="w-full" />
</div>

<div class="pb-[1000px]" />
