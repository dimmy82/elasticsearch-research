import {writable} from "svelte/store";

export let companies = writable(
    [{name: "dummy"}]
)