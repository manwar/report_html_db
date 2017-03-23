/**
 * This is the library dedicated to the clients Here we have the layer of
 * communication between application and services
 * @author Wendel Hime Lino Castro
 */

/**
 * Method used to get content from file HTML
 * 
 * @param filepath:
 *            directory + fileto be read
 * @returns XMLHttpRequest
 */
function getHTMLContent(filepath) {
    return $.ajax({
        type : "GET",
        dataType : "json",
        url : "/GetHTMLContent?filepath=" + filepath,
        async : false,
        cache : false
    });
}

/**
 * Method used to get components
 * 
 * @returns XMLHttpRequest
 */
function getComponents() {
    return $.ajax({
        type : "GET",
        dataType : "json",
        url : "/Components",
        async : false,
        cache : false
    });
}

/**
 * Method used to search by contig
 * 
 * @param serializedForm:
 *            serialized form
 * @returns XmlHttpRequest
 */
function searchContig(serializedForm) {
    return $.ajax({
        type : "GET",
        dataType : "json",
        url : "/Contig?" + serializedForm,
        async : false,
        cache : false
    });
}

/**
 * Method used to search by features
 * 
 * @param geneId:
 *            ID of gene
 * @param geneDescription:
 *            Description of gene
 * @param noDescription:
 *            Content to not be found
 * @param featureId:
 *            Can be a list of feature IDs or just one
 * @returns XMLHttpRequest
 */
function searchGene(geneId, geneDescription, noDescription, individually,
        featureId) {
    return $.ajax({
        type : "GET",
        dataType : "json",
        url : "/SearchDatabase/Gene/" + geneId + "/" + geneDescription + "/"
                + noDescription + "/" + individually + "/" + featureId,
        async : false,
        cache : false
    });
}

/**
 * Method used to search features
 * 
 * @param serializedForm:
 *            serialized form
 * @returns XMLHttpRequest
 */
function searchGene(serializedForm) {
    return $.ajax({
        type : "GET",
        dataType : "json",
        url : "/SearchDatabase/Gene?" + serializedForm,
        async : false,
        cache : false
    });
}

/**
 * Method used to get feature by position
 * 
 * @param start:
 *            start position of the sequence
 * @param end:
 *            end position of the sequence
 * @returns XMLHttpRequest
 */
function getGeneByPosition(start, end) {
    return $.ajax({
        type : "GET",
        dataType : "json",
        url : "/SearchDatabase/geneByPosition/" + start + "/" + end,
        async : false,
        cache : false
    });
}

/**
 * Method used to search for analyses CDS
 * 
 * @param serializedForm:
 *            serialized form
 * @returns XMLHttpRequest
 */
function analysesCDS(serializedForm) {
    return $.ajax({
        type : "GET",
        dataType : "json",
        url : "/SearchDatabase/analysesCDS?" + serializedForm,
        async : false,
        cache : false
    });
}

/**
 * Method used to realize search by tRNA
 * 
 * @param serializedForm:
 *            serialized form
 * @returns XMLHttpRequest
 */
function trnaSearch(serializedForm) {
    return $.ajax({
        type : "GET",
        dataType : "json",
        url : "/SearchDatabase/trnaSearch?" + serializedForm,
        async : false,
        cache : false
    });
}

/**
 * Method used to realize search by tandem repeats
 * 
 * @param serializedForm:
 *            serialized form
 * @returns XMLHttpRequest
 */
function tandemRepeatsSearch(serializedForm) {
    return $.ajax({
        type : "GET",
        dataType : "json",
        url : "/SearchDatabase/tandemRepeatsSearch?" + serializedForm,
        async : false,
        cache : false
    });
}

/**
 * Method used to realize search by non coding RNA
 * 
 * @param serializedForm:
 *            serialized form
 * @returns XmlHttpRequest
 */
function ncRNASearch(serializedForm) {
    return $.ajax({
        type : "GET",
        dataType : "json",
        url : "/SearchDatabase/ncRNASearch?" + serializedForm,
        async : false,
        cache : false
    });
}

/**
 * Method used to realize search by transcriptional terminators
 * 
 * @param serializedForm:
 *            serialized form
 * @returns XmlHttpRequest
 */
function transcriptionalTerminatorSearch(serializedForm) {
    return $.ajax({
        type : "GET",
        dataType : "json",
        url : "/SearchDatabase/transcriptionalTerminatorSearch?"
                + serializedForm,
        async : false,
        cache : false
    });
}

/**
 * Method used to realize search by ribosomal binding sites
 * 
 * @param serializedForm:
 *            serialized form
 * @returns XmlHttpRequest
 */
function rbsSearch(serializedForm) {
    return $.ajax({
        type : "GET",
        dataType : "json",
        url : "/SearchDatabase/rbsSearch?" + serializedForm,
        async : false,
        cache : false
    });
}

/**
 * Method used to realize search by horizontal transferences
 * 
 * @param serializedForm:
 *            serialized form
 * @returns XmlHttpRequest
 */
function alienhunterSearch(serializedForm) {
    return $.ajax({
        type : "GET",
        dataType : "json",
        url : "/SearchDatabase/alienhunterSearch?" + serializedForm,
        async : false,
        cache : false
    });
}

/**
 * Method used to return basic data of genes from database: the beginning
 * position from sequence, final position from the sequence, type, name
 * 
 * @param id:
 *            Id of gene
 * @returns XMLHttpRequest
 */
function getGeneBasics(id) {
    return $.ajax({
        type : "GET",
        dataType : "json",
        url : "/SearchDatabase/GetGeneBasics/" + id,
        async : false,
        cache : false
    });
}

/**
 * Method used to get properties of internal evidences
 * 
 * @param id:
 *            Gene ID
 * @param component:
 *            Component name
 * @returns XMLHttpRequest
 */
function getIntervalEvidenceProperties(id, component) {
    return $.ajax({
        type : "GET",
        dataType : "json",
        url : "/SearchDatabase/getIntervalEvidenceProperties/" + id + "/"
                + component,
        async : false,
        cache : false
    });
}

/**
 * Method used to return properties of evidence typed like similarity
 * 
 * @param id:
 *            Id of gene
 * @param component:
 *            Component name
 * @returns XMLHttpRequest
 */
function getSimilarityEvidenceProperties(id, component) {
    return $.ajax({
        type : "GET",
        dataType : "json",
        url : "/SearchDatabase/getSimilarityEvidenceProperties/" + id + "/"
                + component,
        async : false,
        cache : false
    });
}

/**
 * Method used to get subsequence
 * 
 * @param type:
 *            Type of sequence
 * @param contig:
 *            Contig to extract data
 * @param sequenceName:
 *            Sequence name
 * @param start:
 *            Start of the sequence
 * @param end:
 *            End of the sequence
 * @returns XMLHttpRequest
 */
function getSubsequence(type, contig, sequenceName, start, end) {
    return $.ajax({
        type : "GET",
        dataType : "json",
        url : "/SearchDatabase/GetSubsequence/" + type + "/" + contig + "/"
                + sequenceName + "/" + start + "/" + end,
        async : false,
        cache : false
    });
}

/**
 * Method used to get subevidences
 * 
 * @param featureId:
 *            Feature ID
 * @returns XMLHttpRequest
 */
function getSubEvidences(featureId) {
    return $.ajax({
        type : "GET",
        dataType : "json",
        url : "/SearchDatabase/subEvidences/" + featureId,
        async : false,
        cache : false
    });
}