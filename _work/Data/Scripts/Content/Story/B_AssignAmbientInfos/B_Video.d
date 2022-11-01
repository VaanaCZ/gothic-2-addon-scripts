// *********************************
// Sprachausgabe der Video-Sequenzen
// *********************************

func void B_Video()
{
	// ------ Intro ------
	AI_Output (self, other, "INTRO_Xardas_Speech_14_00"); //Jeden człowiek odmienił losy wielu setek...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_01"); //Ale zapłacił za to wysoką cenę.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_02"); //Pokonał Śniącego i zniszczył Barierę...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_03"); //...ale gdy innym więźniom udało się uciec, on pozostał, pogrzebany pod ziemią...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_04"); //To ja wysłałem go do walki ze Śniącym.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_05"); //To ja sprowadzę go teraz z powrotem.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_06"); //Jest słaby i wiele zapomniał.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_07"); //Ale żyje...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_08"); //Powrócił!
	
	// ------ Lagerfeuer ------
	AI_Output (self, other, "INTRO_DiegoGorn_12_00"); //Oczywiście, że jeszcze żyje! Co ci strzeliło do głowy?
	AI_Output (self, other, "INTRO_DiegoGorn_11_01"); //Obyś miał rację...
	AI_Output (self, other, "INTRO_DiegoGorn_12_02"); //Czujesz to?
	AI_Output (self, other, "INTRO_DiegoGorn_11_03"); //Co?
	AI_Output (self, other, "INTRO_DiegoGorn_12_04"); //Ziemia...
	
	
	// ------ Extro ------
	AI_Output (other, self, "Extro_Tempel_15_01"); //Xardas! A co...
	AI_Output (other, self, "Extro_Tempel_14_02"); //Nie teraz...
	AI_Output (other, self, "Extro_Tempel_14_03"); //Jestem gotów! Wybierz mnie! Taaak!
	AI_Output (other, self, "Extro_Tempel_15_04"); //Gdzie on jest?
	
	// ------ Outro ------
	AI_Output (self, other, "OUTRO_Xardas_14_00"); //A człowiek pokonał bestię, która wróciła do królestwa Beliara...
	AI_Output (other, self, "OUTRO_Xardas_15_01"); //Xardas! Co się właściwie stało w świątyni Irdorath?
	AI_Output (self, other, "OUTRO_Xardas_14_02"); //Z pomocą Innosa pokonałeś potężnego wysłannika Zła.
	AI_Output (self, other, "OUTRO_Xardas_14_03"); //A ja przejąłem całą jego moc.
	AI_Output (self, other, "OUTRO_Xardas_14_04"); //Odkąd opuściłem Krąg Ognia, było to moim jedynym celem.
	AI_Output (self, other, "OUTRO_Xardas_14_05"); //Ale aby go osiągnąć, musiałem tobie najpierw pomóc.
	AI_Output (self, other, "OUTRO_Xardas_14_06"); //To, co nie udało się w świątyni Śniącego, dokonało się teraz.
	AI_Output (self, other, "OUTRO_Xardas_14_07"); //Beliar wybrał mnie na swojego orędownika.
	AI_Output (other, self, "OUTRO_Xardas_15_08"); //A więc służysz teraz bogu ciemności?
	AI_Output (self, other, "OUTRO_Xardas_14_09"); //Nie jestem posłuszny Beliarowi bardziej niż ty Innosowi.
	AI_Output (self, other, "OUTRO_Xardas_14_10"); //Nawet bogowie nie wiedzą, co nas czeka w przyszłości.
	AI_Output (self, other, "OUTRO_Xardas_14_11"); //Dopiero zaczynam rozumieć, jakie możliwości otwierają się teraz przede mną.
	AI_Output (self, other, "OUTRO_Xardas_14_12"); //Jedno jest wszakże pewne - jeszcze się spotkamy.
	
	// ------ Outro Xardas Kapitän ------
	AI_Output (self, other, "OUTRO_Xardas_04_00"); //Kotwica w górę!
	
	// ------ Drachenangriff ------
	AI_Output (self, other, "Cutscene_Drachen_04_00"); //Hmmm?
	AI_Output (self, other, "Cutscene_Drachen_04_01"); //O cholera!
	AI_Output (self, other, "Cutscene_Drachen_04_02"); //(jęk)
	AI_Output (self, other, "Cutscene_Drachen_04_03"); //Aaaargh!
	AI_Output (self, other, "Cutscene_Drachen_04_04"); //(wrzask)
	
	// ------ OrkSturm ------
	AI_Output (self, other, "Cutscene_OrcSturm_04_00"); //Zamykać bramę!
	AI_Output (self, other, "Cutscene_OrcSturm_04_01"); //Zatrzymać ich!
	AI_Output (self, other, "Cutscene_OrcSturm_04_02"); //Aaaargh!
	
	// ------ Outro Credits ------
	AI_Output (self, other, "OUTRO_Schiff_12_00"); //Jesteśmy przeciążeni! Musimy wyrzucić za burtę część złota!
	AI_Output (other, self, "OUTRO_Schiff_15_01"); //Łapy precz od złota!
	AI_Output (self, other, "OUTRO_Schiff_12_02"); //Słuchaj, lepiej będzie, jeśli...
	AI_Output (other, self, "OUTRO_Schiff_15_03"); //Nie ma mowy! W żadnym wypadku!
	AI_Output (self, other, "OUTRO_Schiff_11_04"); //Podobno przegrywamy tę wojnę z orkami, tak?
	AI_Output (other, self, "OUTRO_Schiff_15_05"); //I co z tego?
	AI_Output (self, other, "OUTRO_Schiff_11_06"); //To, że i tak nigdzie nie wydamy tyle złota...
	AI_Output (other, self, "OUTRO_Schiff_15_07"); //Złoto zostaje na pokładzie!
	AI_Output (self, other, "OUTRO_Schiff_12_08"); //Co nam po złocie, skoro zatoniemy przy pierwszym silniejszym podmuchu?!
	AI_Output (other, self, "OUTRO_Schiff_15_09"); //Morze jest przecież spokojne...
	AI_Output (self, other, "OUTRO_Schiff_12_10"); //Tak, CHWILOWO!
	AI_Output (other, self, "OUTRO_Schiff_15_11"); //Spokojnie. Wszystko będzie w porządku!
	
	//ADDON
	AI_Output	(other, self, "DIA_Addon_AddonIntro_15_00"); //Ludzie?
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_01"); //Ludzie są słabi.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_02"); //Zbyt szybko poddają się pokusom zła...
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_03"); //Próbują paktować z siłami, których nie rozumieją, których nie są w stanie kontrolować.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_04"); //Ci, których wiara jest czysta, już rozpoczęli walkę z wrogiem.
	
	//ADDON - NEU
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_00"); //Gniew Beliara wzmógł się po upadku Bariery i pokonaniu Śniącego!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_01"); //Zapisano, że do tego świata przyzwany zostanie potężny artefakt.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_02"); //'Gdy Bóg Ciemności wysyła swe sługi z misją'...
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_03"); //I właśnie tak się stało. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_04"); //Ta misja jest już rozpoczęta.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_05"); //Sługi Beliara bezczeszczą prastare chramy w poszukiwaniu swego celu.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_06"); //Sługi Beliara bezczeszczą prastare chramy.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_07"); //Budzą się strażnicy tych chramów... A ich gniew wstrząśnie ziemią!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_08"); //Wszyscy potężni magowie wyspy wyczuwają ten gniew. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_09"); //Niektórzy z nich są gotowi stawić czoła temu nowemu zagrożeniu...
};
