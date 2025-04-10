<script>
  import { ArrowRightFromLine } from 'lucide-svelte';
  import { createEventDispatcher } from 'svelte';
  import Logo from '$assets/dc-logo-no-text.png';
  import FrogImage from '$assets/frog.png';
  const dispatch = createEventDispatcher();
</script>

<div class="h-full flex flex-col">
  <div
    class="flex mx-4 py-4 justify-between border-b border-zinc-200 items-center"
  >
    <div>
      <h2 class="font-bold text-2xl text-zinc-900">Methodology</h2>
      <p class="text-zinc-500">How we built this map</p>
    </div>
    <button
      class="text-center text-sm w-[7rem] transition-all duration-100 bg-zinc-100 hover:bg-zinc-800 hover:text-white font-bold text-zinc-900 px-4 py-4 rounded-lg flex items-center justify-center gap-2"
      on:click={() => dispatch('back')}
      >Back
      <ArrowRightFromLine class="size-4" />
    </button>
  </div>

  <div class="px-4 py-6 flex-1 text-sm text-zinc-600 flex flex-col">
    <div class="flex-1">
      <p class="max-w-[30rem]">
        Using a 30m digital elevation model from <a
          href="https://spacedata.copernicus.eu/collections/copernicus-digital-elevation-model"
          target="_blank"
          rel="noopener noreferrer">Copernicus</a
        >, we analyzed the city's terrain to understand it's water flow
        patterns. We used WhiteboxTools, a geospatial analysis library, to map
        water accumulation, and identify major streams across the landscape. To
        produce the graduated layer you see on the map, we smoothened these
        accumulation values and reclassified them into distinct categories.
      </p>
    </div>
  </div>
</div>

<style lang="postcss">
  a {
    @apply underline underline-offset-4 leading-3;
  }
</style>
