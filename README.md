**The scripts are located in separate branches!**

# Gothic 2 Addon Scripts
While working on a project for Gothic 2: Night of the Raven, I found myself in a similar situation as with the [Gothic 1 Classic Scripts](https://github.com/VaanaCZ/gothic-1-classic-scripts/), that being the lack of source code for Gothic 2's various language translations.

In addition, Gothic 2: Night of the Raven faced a similar problem as the original Gothic, in that different translations were based off different script versions, and therefore included bugs that were already fixed in other versions.

Therefore, I decided to fix this by first carefully reconstructing the source code for 8 of the official translations and then "unifying" them into a single code base, which includes the best out of each language version.

### Original scripts
As mentioned, each of the 8 official language versions were carefully examined and reconstructed using the scripts available from the MDK as a base.  When compiled, these scripts should produce .DAT files which are identical in size and symbol order to the original scripts.

Please note, however, that the original scripts were compiled using a different engine revision and as such, the resulting .DAT files might define different externals, when compiled using the "report version".

In addition, changes had to be made to allow the scripts to be compilable using a vanilla version of the game (mainly the substitution of `"` with `'` in string assignment).

### Unified scripts
After each language version was reconstructed, the fixes and improvements of each one were taken into account to produce a single "unified" codebase for all 8 languages. Most of the improvements were taken directly from the French release, as it appears to be based on the newest version of the scripts that Piranha Bytes made.

It's important to state that **this is not a bugfix!** These scripts are only as up-to-date as Piranha Bytes made them, meaning there are still lots of issues, that are outside the scope of this project.

**tl;dr**
Basically, if you are looking to download the scripts to do some modding, download the unified scripts, they are newer.

## A few things to mention

### Encoding
The scripts are encoded in Windows-1250 for Latin languages *(English, German, Polish, Czech, French, Spanish and Italian)* and in Windows-1251 for Cyrillic languages *(Russian)*. This is because Gothic does not support multibyte encodings and Unicode. Please also note, that in order to display the characters properly in-game, your game must have the correct fontmap texture included.

The original Czech release used a nonstandard character encoding and a custom font. For the purpose of this project, the scripts have been transcoded to use the standardised  Windows-1250 encoding. The original non-transcoded scripts have been included in the `2.7-CS` branch or archival purposes.

### Extended ASCII trimming issue
When Spacer II produces an OU file, it makes sure to trim any whitespace around the texts of dialogues. Sadly, there is a small oversight in the piece of code that performs this trimming, in that it also removes any Non-Standard ASCII characters. This means that if your dialogue ends with any of these `áąćčďéěęíłńňóřśšťůýžźż` the ending of the dialogue will be trimmed.

For example `aáącčć` becomes just `aáąc`.

This issue mainly affects the Polish, Czech and Russian releases.

Here are a few examples, before and after:

**Czech**
```d
AI_Output(self,other,"DIA_Pedro_WELCOME_09_02");	//Co potřebuješ
```
```d
AI_Output(self,other,"DIA_Pedro_WELCOME_09_02");	//Co potřebuje
```
**Polish**
```d
AI_Output(self,other,"DIA_Rosi_HILFE_17_06");	//Idź przodem, będziemy szli za tobą
```
```d
AI_Output(self,other,"DIA_Rosi_HILFE_17_06");	//Idź przodem, będziemy szli za tob
```
**Russian**
```d
AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_05");	//Если ты узнаешь что-нибудь об их судьбе, обязательно дай мне знать
```
```d
AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_05");	//Если ты узнаешь что-нибудь об их судьбе,
```

The simplest way to solve this is to make sure that your dialogue always ends with a Standard ASCII character such as a dot, comma or an exclamation mark. This is also the reason why the OU in the scripts differs, since I purposefully added dots to the ends of sentences which were affected by this problem.

The reason the original translations did not have this issue is because they used other methods which did not perform any whitespace trimming *(some used hex editors :-) )*.

---
**Tools used:**
- Spacer 1.5
- GothicSourcer 3.15
- DecDat
- WinMerge
- ...and a hanful custom-made scripts from dialogue/string comparison, stripping and replacement.

**Special thanks to:**
- MaGoth, for the LangPack