<script lang="ts">
  import { onMount } from 'svelte';

  export let description: string = 'Default description of your website';
  export let keywords: string = 'svelte, seo, web development';
  export let author: string = 'Your Name';
  

  let currentUrl: string;

  onMount(() => {
    currentUrl = window.location.href;
  });
</script>

<svelte:head>
  <!-- Basic Meta Tags -->
  
  <meta name="description" content={description} />
  <meta name="keywords" content={keywords} />
  <meta name="author" content={author} />
  <meta name="robots" content="index, follow" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />


  <!-- Additional Meta Tags -->
  <meta name="language" content="English" />
  <meta name="revisit-after" content="7 days" />
  <meta name="distribution" content="global" />
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
</svelte:head>
