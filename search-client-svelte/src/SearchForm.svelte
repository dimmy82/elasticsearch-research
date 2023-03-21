<script>
    import {companies} from "./Store.js";

    let searchValue;

    const searchCompany = () => {
        $companies.push({name: searchValue});
        companies.set($companies)
    }
</script>

<h3>company name will be suggested</h3>
<div>
    <input type="text" bind:value={searchValue} placeholder="input any company name you like to search" on:keyup={searchCompany}>
</div>