// *********************************
// Sprachausgabe der Video-Sequenzen
// *********************************

func void B_Video()
{
	// ------ Intro ------
	AI_Output (self, other, "INTRO_Xardas_Speech_14_00"); //Jediný vêzeà dokázal zmênit osud stovky ostatních.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_01"); //Zaplatil za to však vysokou cenu.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_02"); //Porazil Spáèe, znièil bariéru...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_03"); //...ale zatímco ostatní vêzni uprchli, on zùstal pod hromadou suti.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_04"); //Byl jsem to já, kdo jej vyslal proti Spáèi.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_05"); //A jsem to opêt já, kdo jej pâivádí zpêt.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_06"); //Je slabý a mnohé zapomnêl.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_07"); //Ale je naživu...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_08"); //Je zpátky!
	
	// ------ Lagerfeuer ------
	AI_Output (self, other, "INTRO_DiegoGorn_12_00"); //(u ohnê) Samozâejmê že žije. Cos myslel?
	AI_Output (self, other, "INTRO_DiegoGorn_11_01"); //Doufejme, že...
	AI_Output (self, other, "INTRO_DiegoGorn_12_02"); //(zachvêní zemê) Cítils to taky?
	AI_Output (self, other, "INTRO_DiegoGorn_11_03"); //Co?
	AI_Output (self, other, "INTRO_DiegoGorn_12_04"); //Zemê...
	
	
	// ------ Extro ------
	AI_Output (other, self, "Extro_Tempel_15_01"); //(užasle) Xardasi! Co...
	AI_Output (other, self, "Extro_Tempel_14_02"); //(naâíkavê) Teë ne...
	AI_Output (other, self, "Extro_Tempel_14_03"); //(fanaticky) Jsem pâipraven... zvol mê! Ano...
	AI_Output (other, self, "Extro_Tempel_15_04"); //(pro sebe) Kde je?
	
	// ------ Outro ------
	AI_Output (self, other, "OUTRO_Xardas_14_00"); //(cituje) A èlovêk zabil bestii a ta sestoupila do Beliarovy âíše...
	AI_Output (other, self, "OUTRO_Xardas_15_01"); //Xardasi! Co se vlastnê pâesnê stalo v Irdorathském chrámu?
	AI_Output (self, other, "OUTRO_Xardas_14_02"); //S Innosovou pomocí jsi porazil ztêlesnêní zla.
	AI_Output (self, other, "OUTRO_Xardas_14_03"); //A já si vzal jeho moc.
	AI_Output (self, other, "OUTRO_Xardas_14_04"); //Byl to mùj jediný cíl od chvíle, co jsem opustil kruh ohnê.
	AI_Output (self, other, "OUTRO_Xardas_14_05"); //Abych ho dosáhl, pomáhal jsem ti v cestê za tvým cílem.
	AI_Output (self, other, "OUTRO_Xardas_14_06"); //Co mi bylo zapovêzeno v chrámu Spáèe, se teë koneènê naplnilo.
	AI_Output (self, other, "OUTRO_Xardas_14_07"); //Beliar si vybral mê.
	AI_Output (other, self, "OUTRO_Xardas_15_08"); //Tak to teë nasloucháš bohu zla?
	AI_Output (self, other, "OUTRO_Xardas_14_09"); //Ne. Nesloužím Beliarovi o nic víc, než ty nasloucháš Innosovi!
	AI_Output (self, other, "OUTRO_Xardas_14_10"); //Ani bohové sami nevêdí, jaký osud je nám pâedurèen.
	AI_Output (self, other, "OUTRO_Xardas_14_11"); //A já teprve teë zaèínám chápat, jaké cesty se mi zaèínají otevírat.
	AI_Output (self, other, "OUTRO_Xardas_14_12"); //Ale jedna vêc je jistá. Ještê se uvidíme...
	
	// ------ Outro Xardas Kapitän ------
	AI_Output (self, other, "OUTRO_Xardas_04_00"); //(volá) Vyplouváme!
	
	// ------ Drachenangriff ------
	AI_Output (self, other, "Cutscene_Drachen_04_00"); //(dívá se do dálky, nêco vidí) Hmmm?
	AI_Output (self, other, "Cutscene_Drachen_04_01"); //(huhàá) A do hajzlu!
	AI_Output (self, other, "Cutscene_Drachen_04_02"); //(kašle, dáví) - (rùzné)
	AI_Output (self, other, "Cutscene_Drachen_04_03"); //Aaaargh! (rùzné)
	AI_Output (self, other, "Cutscene_Drachen_04_04"); //(táhlý smrtelný výkâik, 4 sekundy)
	
	// ------ OrkSturm ------
	AI_Output (self, other, "Cutscene_OrcSturm_04_00"); //Zavâete bránu!!! (rùzné)
	AI_Output (self, other, "Cutscene_OrcSturm_04_01"); //Zastavte je!!! (rùzné)
	AI_Output (self, other, "Cutscene_OrcSturm_04_02"); //Aaaargh! (rùzné)
	
	// ------ Outro Credits ------
	AI_Output (self, other, "OUTRO_Schiff_12_00"); //Jsme pâetíženi. Mêli bychom nêjaké zlato shodit pâes palubu.
	AI_Output (other, self, "OUTRO_Schiff_15_01"); //Dej od toho zlata pracky pryè!
	AI_Output (self, other, "OUTRO_Schiff_12_02"); //Hele, vážnê by bylo lepší, kdyby...
	AI_Output (other, self, "OUTRO_Schiff_15_03"); //Už o tom nechci slyšet.
	AI_Output (self, other, "OUTRO_Schiff_11_04"); //Slyšel jsem, že se válka se skâety vyvíjí špatnê.
	AI_Output (other, self, "OUTRO_Schiff_15_05"); //A?
	AI_Output (self, other, "OUTRO_Schiff_11_06"); //Nejspíš nebude všechno to zlato kde utratit.
	AI_Output (other, self, "OUTRO_Schiff_15_07"); //To zlato zùstane na palubê!
	AI_Output (self, other, "OUTRO_Schiff_12_08"); //K èemu nám bude zlato, když v první bouâi pùjdeme ke dnu?
	AI_Output (other, self, "OUTRO_Schiff_15_09"); //Ale já žádnou bouâi nevidím.
	AI_Output (self, other, "OUTRO_Schiff_12_10"); //Zatím...
	AI_Output (other, self, "OUTRO_Schiff_15_11"); //Klídek! Všechno dobâe dopadne!
	
	//ADDON
	AI_Output	(other, self, "DIA_Addon_AddonIntro_15_00"); //(udivenê) ...lidé?
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_01"); //(opovržlivê) Lidé jsou slabí.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_02"); //(opovržlivê) Pâíliš snadno podléhají pokušením.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_03"); //A tak si obvykle zahrávají se silami, kterým nerozumêjí a jež nedokážou ovládat.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_04"); //Ti, kdož ve své víâe ještê nezakolísali, už zaèali bojovat s nepâítelem.
	
	//ADDON - NEU
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_00"); //Po pádu bariéry a osvobození Spáèe Beliarùv hnêv ještê vzrostl.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_01"); //Jak se píše ve starých posvátných knihách, do tohoto svêta se vrátí mocný artefakt.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_02"); //(cituje) 'Když bùh temnot vyslal na prùzkum své služebníky.'
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_03"); //A právê to se zrovna stalo. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_04"); //To hledání už zaèalo dávno!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_05"); //Beliarovi služebníci pâi svém pátrání znesvêcují nejstarší boží svatynê.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_06"); //Beliarovi služebníci znesvêcují nejstarší boží svatynê.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_07"); //A tak se probudili strážci têchto posvátných míst. To jejich hnêv otâásá zemí!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_08"); //Ten hnêv cítí každý mocnêjší mág na tomto ostrovê. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_09"); //A nêkteâí už se pokusili té hrozbê èelit.
};
