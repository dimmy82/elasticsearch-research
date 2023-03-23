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
                                "match_phrase": {
                                    "name_en.exact": {
                                        "query": searchValue,
                                        "boost": 5
                                    }
                                }
                            },
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
                                "match_phrase": {
                                    "name_jp.exact": {
                                        "query": searchValue,
                                        "boost": 5
                                    }
                                }
                            },
                            {
                                "match_phrase_prefix": {
                                    "name_jp.language": {
                                        "query": searchValue,
                                        "boost": 3
                                    }
                                }
                            },
                            {
                                "match_phrase_prefix": {
                                    "name_jp.language_alphabet": {
                                        "query": searchValue,
                                        "boost": 2
                                    }
                                }
                            },
                            {
                                "match_phrase_prefix": {
                                    "name_jp.ngram": {
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
                        "name_en.exact": {"pre_tags": ["<span style=\"color: red\">"], "post_tags": ["</span>"]},
                        "name_en.language": {"pre_tags": ["<span style=\"color: red\">"], "post_tags": ["</span>"]},
                        "name_en.ngram": {"pre_tags": ["<span style=\"color: red\">"], "post_tags": ["</span>"]},
                        "name_jp.exact": {"pre_tags": ["<span style=\"color: red\">"], "post_tags": ["</span>"]},
                        "name_jp.language": {"pre_tags": ["<span style=\"color: red\">"], "post_tags": ["</span>"]},
                        "name_jp.language_alphabet": {"pre_tags": ["<span style=\"color: red\">"], "post_tags": ["</span>"]},
                        "name_jp.ngram": {"pre_tags": ["<span style=\"color: red\">"], "post_tags": ["</span>"]}
                    }
                },
                "_source": false,
                "size": 20
            })
        }).then(response => response.json())
        // console.log(result)

        let companiesFound = [];
        let resultJson = JSON.parse(JSON.stringify(result));
        companiesFound.push({name: `took: ${resultJson.took}`})
        console.log(resultJson.hits.hits)
        resultJson.hits.hits.forEach((hit) => {
            if (hit.highlight["name_en.exact"]) {
                companiesFound.push({name: `${hit.highlight["name_en.exact"]}　　　(${hit._score})`})
            } else if (hit.highlight["name_jp.exact"]) {
                companiesFound.push({name: `${hit.highlight["name_jp.exact"]}　　　(${hit._score})`})
            } else if (hit.highlight["name_en.language"]) {
                companiesFound.push({name: `${hit.highlight["name_en.language"]}　　　(${hit._score})`})
            } else if (hit.highlight["name_jp.language"]) {
                companiesFound.push({name: `${hit.highlight["name_jp.language"]}　　　(${hit._score})`})
            } else if (hit.highlight["name_jp.language_alphabet"]) {
                companiesFound.push({name: `${hit.highlight["name_jp.language_alphabet"]}　　　(${hit._score})`})
            } else if (hit.highlight["name_en.ngram"]) {
                companiesFound.push({name: `${hit.highlight["name_en.ngram"]}　　　(${hit._score})`})
            } else if (hit.highlight["name_jp.ngram"]) {
                companiesFound.push({name: `${hit.highlight["name_jp.ngram"]}　　　(${hit._score})`})
            }
        });

        companies.set(companiesFound)
    }
</script>

<h3>company name will be suggested</h3>
<div>
    <input type="text" bind:value={searchValue} placeholder="input any company name you like to search" on:keyup={searchCompany}>
</div>