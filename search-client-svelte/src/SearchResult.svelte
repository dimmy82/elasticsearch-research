<script>
    import {companies} from "./Store.js";
</script>

<div style="padding-left: 900px">
    {#each $companies as company, index}
        <div style="text-align: left">{@html company.name}</div>
    {/each}
</div>