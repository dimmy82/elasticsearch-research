<script>
    import {companies} from "./Store.js";
</script>

<div>
    {#each $companies as company, index}
        <div>{company.name}</div>
    {/each}
</div>