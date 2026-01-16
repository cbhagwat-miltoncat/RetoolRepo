// Filter parts catalog by search text and category
const data = {{ partsCatalogData.value }};
const parts = data?.parts || [];

const search = ({{ partsSearchInput.value }} || '').toLowerCase();
const category = {{ categorySelect.value }} || '';

return parts.filter((p) => {
  const matchesCategory = !category || p.type === category;
  const haystack = `${p.type} ${p.size} ${p.partNumber}`.toLowerCase();
  const matchesSearch = !search || haystack.includes(search);
  return matchesCategory && matchesSearch;
});