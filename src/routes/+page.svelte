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
		<div class="flex flex-col justify-center hover:bg-sky-200 rounded-md">
			<a
				href="https://huggingface.co/rail-berkeley"
				class="hover:underline text-black p-4 flex flex-col items-center"
			>
				<img src="{base}/weights.svg" alt="weights" class="w-16" />
				Weights
			</a>
		</div>
	</div>
</div>

<!-- full-width video carousel -->
<div class="w-full bg-slate-100 px-2 md:px-16 py-8">
	<VideoCarousel {renderVideos} />
</div>

<!-- content column again -->
<div class="max-w-6xl w-full px-2 pt-4 mx-auto">
	<p class="mt-8 text-l">
		We introduce <Octo />, our ongoing effort for building open-source, widely applicable generalist
		policies for robotic manipulation. The Octo model is a transformer-based diffusion policy,
		pretrained on 800k robot episodes from the
		<a href="https://robotics-transformer-x.github.io/">Open X-Embodiment dataset</a>. It supports
		flexible task and observation definitions and can be quickly finetuned to new observation and
		action spaces. We are introducing two initial versions of Octo, Octo-Small (27M parameters) and
		Octo-Base (93M parameters).
	</p>
	<img src="{base}/teaser.jpg" alt="teaser" class="w-full mt-16 px-16" />

	<h2 class="text-4xl mt-16">The Model</h2>
	<p class="mt-8">
		The design of the Octo model emphasizes flexibility and scale: the model is designed to support
		a variety of commonly used robots, sensor configurations, and actions, while providing a generic
		and scalable recipe that can be trained on large amounts of data. Octo supports both natural
		language instructions and goal images, observation histories, and multi-modal action
		distributions via diffusion decoding. Furthermore, we designed Octo specifically to support
		efficient finetuning to new robot setups, including robots with different actions and different
		combinations of cameras and proprioceptive information. This design was selected specifically to
		make Octo a flexible and broadly applicable generalist robotic policy that can be utilized for a
		variety of downstream robotics applications and research projects.

		<img src="{base}/architecture.jpg" alt="model" class="w-full mt-16 px-16" />
	</p>

	<h2 class="text-4xl mt-16">The Data</h2>

	<p class="mt-8">
		We train Octo on a mixture of 25 datasets from the Open X-Embodiment Dataset, a diverse
		collection of robot learning datasets. Our training mixture includes data from a variety of
		robot embodiments, scenes, and tasks. These datasets are heterogeneous not just in terms of the
		robot type, but also in the sensors (e.g., including or not including wrist cameras) and labels
		(e.g., including or not including language instructions).
		<img src="{base}/sampling_weights.jpg" alt="model" class="w-3/4 mt-16 mx-auto" />
	</p>

	<h2 class="text-4xl mt-16">The Results</h2>
	<p class="mt-8">
		We evaluate Octo on 6 real robot setups across 3 institutions. Our evaluations capture diverse
		object interactions (e.g., "WidowX BridgeV2"), long task horizons (e.g., "Stanford Coffee") and
		precise manipulation (e.g., "Berkeley Peg Insert"). We evaluate Octo's capabilities to control
		robots in environments from the pretraining data out-of-the-box and to efficiently finetune to
		new tasks and environments with small target domain datasets. We also test finetuning with new
		observations (force-torque inputs for "Berkeley Peg Insert") and action spaces (joint position
		control in "Berkeley Pick-up").
		<img src="{base}/exp_setups.jpg" alt="model" class="w-full mt-16 px-8 mx-auto" />
	</p>

	<div class="flex flex-nowrap justify-between mt-16">
		
		<table class="w-1/4 mx-8 border-collapse text-center text-xs md:text-base">
			<thead>
				<tr>
					<th colspan="3" class="text-lg">Zero-shot</th>
				</tr>
				<tr class="border-b border-t-2 border-black">
					<th />
					<th>WindowX Sink</th>
					<th>UR5</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>RT-1-X</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>
				<tr>
					<td>RT-2-X</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>
				<tr class="border-b-2 border-black">
					<td><Octo/></td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>
			</tbody>
		</table>
		<table class="w-3/4 mx-8 border-collapse text-center text-xs md:text-base">
			<thead>
				<tr>
					<th colspan="6" class="text-lg">Finetuning</th>
				</tr>
				<tr class="border-b border-t-2 border-black">
					<th />
					<th>CMU Baking</th>
					<th>Stanford Coffee</th>
					<th>Berkeley Peg Insert<sup>*</sup></th>
					<th>Berkeley Pick-up<sup>†</sup></th>
					<th>Average</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>From Scratch</td>
					<td>0.00</td>
					<td>0.00</td>
					<td>0.00</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>
				<tr>
					<td>VC-1</td>
					<td>0.00</td>
					<td>0.00</td>
					<td>0.00</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>
				<tr class="border-b-2 border-black">
					<td><Octo/></td>
					<td>0.00</td>
					<td>0.00</td>
					<td>0.00</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="mt-2 flex justify-center text-xs md:text-base">
        <div class="px-4"><sup>*</sup>New observation input (force-torque proprioception)</div>
        <div class="px-4"><sup>†</sup>New action space (joint position control)</div>
    </div>
</div>

<div class="pb-[1000px]" />

<style>
	th {
		font-weight: normal;
	}

	tr > td:first-child {
		text-align: left;
	}

	td  {
		line-height: 2rem;
	}
</style>
