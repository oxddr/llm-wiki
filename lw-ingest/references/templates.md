# Wiki Page Templates

### Unit Template (`wiki/jednostki/`)
*Note: No H1 header (#). Obsidian uses the filename as the title.*
```markdown
## Historia formacji
(Krótki rys historyczny formacji. Jeśli źródło podaje konkretne regimenty lub dowódców, wymień ich tutaj. **W przypadku postaci historycznej zmień ten nagłówek na "Życiorys"**.)

## Wygląd
(Opis wizualny, ubiór, uzbrojenie - bez statystyk mechanicznych. Skup się na cechach historycznych/fizycznych, nie na wyglądzie konkretnej figurki.)

## W grze
### Edycja 1
- Reprezentowana przez: (Nazwa jednostki w 1ed, np. Chorągiew husarska)

### Edycja 2
- Reprezentowana przez: (Nazwa Jednostki lub Grupy w 2ed)
- Wymagane ulepszenia: (Jeśli dotyczy, np. konkretny typ uzbrojenia lub ulepszenie wyszkolenia)

## Kolekcjonowanie i modelowanie
- Modele: [[id-produktu]] (Jeśli źródło dotyczy 1ed, a posiadasz wiedzę o odpowiednikach w 2ed, zasugeruj je tutaj.)
- Porady: (Mieszanie zestawów, konwersje, linki do warsztatu [[Konwersja]]))

## Źródła
- [[Nazwa_Zrodla_pdf]]
```

### Product Template (`wiki/products/`)
```markdown
---
aliases:
   - [ID] (powiń jeśli nie ma)
---

# [ID]: Product Name
**Materiał**: [Plastik/Żywica] (powiń jeśli metal)

## Zawartość
- List of components/figures.

## Zastosowanie
- [[unit-1]]
- [[unit-2]]

## Źródła
- [[Nazwa_Zrodla_pdf]]
```

### Source Template (`wiki/sources/`)
*Filename: Filename_pdf.md*
```markdown
**Typ**: [Lista armii/Model Specjalny/Zgrupowanie/Podjazd] ()
**Data wydania**: YYYY
**Plik**: [[raw/Nazwa_Pliku.pdf]]

## Zawartość
- Summary of units and content.

## Jednostki
- [[Nazwa Jednostki]]

## Warsztat
- [[Nazwa Poradnika]]

## Źródła
- [[Nazwa_Zrodla_pdf]]
```

### Faction Template (`wiki/frakcje/`)
```markdown
## Rys historyczny
(Krótki rys historyczny frakcji)

## Jednostki
- **Dowództwo**: [[Dowódca]]
- **Jazda**: [[Jednostka 1]], [[Jednostka 2]]
- **Dragonia**: [[Jednostka 3]]
- **Piechota**: [[Jednostka 4]]
   
## Źródła
- [[Nazwa_Zrodla_pdf]]
```
