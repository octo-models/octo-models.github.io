<script>
	import { base } from '$app/paths';
	import { Splide, SplideSlide } from '@splidejs/svelte-splide';
	import '@splidejs/svelte-splide/css';

	export let renderVideos = false;

	const videoNames = ['out_ur5', 'out_cmu', 'out_iliad', 'out_fmb'];

	const videoData = videoNames.map((name) => ({
		src: `videos/${name}.mp4`,
		image_src: `videos/${name}.jpg`,
		text: name.replaceAll('-', ' ')
	}));
</script>

<div class="w-full flex justify-center" id="container">
	<Splide
		options={{
			perPage: 3,
			start: 0,
			autoplay: true,
			type: "loop",
			breakpoints: {
				768: {
					perPage: 1
				}
			}
		}}
	>
		{#each videoData as video, i}
			<SplideSlide>
				{#if renderVideos}
					<div class="px-2">
						<div class="rounded-lg overflow-hidden flex justify-center">
							<video
								class="w-full"
								disableRemotePlayback
								muted
								webkit-playsinline
								playsinline
								loop
								autoplay={true}
								src="{base}/{video.src}"
								poster="{base}/{video.image_src}"
							/>
						</div>
					</div>
				{:else}
					<div class="px-2">
						<div class="rounded-lg overflow-hidden flex justify-center w-full">
							<img class="w-full" autoplay={true} src="{base}/{video.image_src}" />
						</div>
					</div>
				{/if}
			</SplideSlide>
		{/each}
	</Splide>
</div>