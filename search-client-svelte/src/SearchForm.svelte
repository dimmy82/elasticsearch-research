<script>
    import {companies} from "./Store.js";

    let searchValue;

    const searchCompany = async () => {
        let result = await fetch('http://localhost:9200/company/_search', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                "query": {
                    "bool": {
                        "should": [
                            {
                                "match_phrase_prefix": {
                                    "name_en.language": {
                                        "query": searchValue,
                                        "boost": 3
                                    }
                                }
                            },
                            {
                                "match_phrase_prefix": {
                                    "name_en.ngram": {
                                        "query": searchValue,
                                        "boost": 1
                                    }
                                }
                            },
                            {
                                "match_phrase_prefix": {
                                    "name_jp.language": {
                                        "query": searchValue,
                                        "boost": 2
                                    }
                                }
                            },
                            {
                                "match_phrase_prefix": {
                                    "name_jp.language_alphabet": {
                                        "query": searchValue,
                                        "boost": 1.5
                                    }
                                }
                            },
                            {
                                "match_phrase_prefix": {
                                    "name_ja.ngram": {
                                        "query": searchValue,
                                        "boost": 1
                                    }
                                }
                            }
                        ]
                    }
                },
                "highlight": {
                    "fields": {
                        "name_en.ngram": {},
                        "name_en.language": {},
                        "name_jp.ngram": {},
                        "name_jp.language": {},
                        "name_jp.language_alphabet": {}
                    }
                },
                "_source": false,
                "size": 10
            })
        }).then(response => response.json())
        console.log(result)
        // $companies.push({name: searchValue});
        // companies.set($companies)
    }
</script>

<h3>company name will be suggested</h3>
<div>
    <input type="text" bind:value={searchValue} placeholder="input any company name you like to search" on:keyup={searchCompany}>
</div>