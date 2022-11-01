// *********************************
// Sprachausgabe der Video-Sequenzen
// *********************************

func void B_Video()
{
	// ------ Intro ------
	AI_Output (self, other, "INTRO_Xardas_Speech_14_00"); //Jediný vězeň dokázal změnit osud stovky ostatních.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_01"); //Zaplatil za to však vysokou cenu.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_02"); //Porazil Spáče, zničil bariéru...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_03"); //...ale zatímco ostatní vězni uprchli, on zůstal pod hromadou suti.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_04"); //Byl jsem to já, kdo jej vyslal proti Spáči.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_05"); //A jsem to opět já, kdo jej přivádí zpět.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_06"); //Je slabý a mnohé zapomněl.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_07"); //Ale je naživu...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_08"); //Je zpátky!
	
	// ------ Lagerfeuer ------
	AI_Output (self, other, "INTRO_DiegoGorn_12_00"); //(u ohně) Samozřejmě že žije. Cos myslel?
	AI_Output (self, other, "INTRO_DiegoGorn_11_01"); //Doufejme, že...
	AI_Output (self, other, "INTRO_DiegoGorn_12_02"); //(zachvění země) Cítils to taky?
	AI_Output (self, other, "INTRO_DiegoGorn_11_03"); //Co?
	AI_Output (self, other, "INTRO_DiegoGorn_12_04"); //Země...
	
	
	// ------ Extro ------
	AI_Output (other, self, "Extro_Tempel_15_01"); //(užasle) Xardasi! Co...
	AI_Output (other, self, "Extro_Tempel_14_02"); //(naříkavě) Teď ne...
	AI_Output (other, self, "Extro_Tempel_14_03"); //(fanaticky) Jsem připraven... zvol mě! Ano...
	AI_Output (other, self, "Extro_Tempel_15_04"); //(pro sebe) Kde je?
	
	// ------ Outro ------
	AI_Output (self, other, "OUTRO_Xardas_14_00"); //(cituje) A člověk zabil bestii a ta sestoupila do Beliarovy říše...
	AI_Output (other, self, "OUTRO_Xardas_15_01"); //Xardasi! Co se vlastně přesně stalo v Irdorathském chrámu?
	AI_Output (self, other, "OUTRO_Xardas_14_02"); //S Innosovou pomocí jsi porazil ztělesnění zla.
	AI_Output (self, other, "OUTRO_Xardas_14_03"); //A já si vzal jeho moc.
	AI_Output (self, other, "OUTRO_Xardas_14_04"); //Byl to můj jediný cíl od chvíle, co jsem opustil kruh ohně.
	AI_Output (self, other, "OUTRO_Xardas_14_05"); //Abych ho dosáhl, pomáhal jsem ti v cestě za tvým cílem.
	AI_Output (self, other, "OUTRO_Xardas_14_06"); //Co mi bylo zapovězeno v chrámu Spáče, se teď konečně naplnilo.
	AI_Output (self, other, "OUTRO_Xardas_14_07"); //Beliar si vybral mě.
	AI_Output (other, self, "OUTRO_Xardas_15_08"); //Tak to teď nasloucháš bohu zla?
	AI_Output (self, other, "OUTRO_Xardas_14_09"); //Ne. Nesloužím Beliarovi o nic víc, než ty nasloucháš Innosovi!
	AI_Output (self, other, "OUTRO_Xardas_14_10"); //Ani bohové sami nevědí, jaký osud je nám předurčen.
	AI_Output (self, other, "OUTRO_Xardas_14_11"); //A já teprve teď začínám chápat, jaké cesty se mi začínají otevírat.
	AI_Output (self, other, "OUTRO_Xardas_14_12"); //Ale jedna věc je jistá. Ještě se uvidíme...
	
	// ------ Outro Xardas Kapitän ------
	AI_Output (self, other, "OUTRO_Xardas_04_00"); //(volá) Vyplouváme!
	
	// ------ Drachenangriff ------
	AI_Output (self, other, "Cutscene_Drachen_04_00"); //(dívá se do dálky, něco vidí) Hmmm?
	AI_Output (self, other, "Cutscene_Drachen_04_01"); //(huhňá) A do hajzlu!
	AI_Output (self, other, "Cutscene_Drachen_04_02"); //(kašle, dáví) - (různé)
	AI_Output (self, other, "Cutscene_Drachen_04_03"); //Aaaargh! (různé)
	AI_Output (self, other, "Cutscene_Drachen_04_04"); //(táhlý smrtelný výkřik, 4 sekundy)
	
	// ------ OrkSturm ------
	AI_Output (self, other, "Cutscene_OrcSturm_04_00"); //Zavřete bránu!!! (různé)
	AI_Output (self, other, "Cutscene_OrcSturm_04_01"); //Zastavte je!!! (různé)
	AI_Output (self, other, "Cutscene_OrcSturm_04_02"); //Aaaargh! (různé)
	
	// ------ Outro Credits ------
	AI_Output (self, other, "OUTRO_Schiff_12_00"); //Jsme přetíženi. Měli bychom nějaké zlato shodit přes palubu.
	AI_Output (other, self, "OUTRO_Schiff_15_01"); //Dej od toho zlata pracky pryč!
	AI_Output (self, other, "OUTRO_Schiff_12_02"); //Hele, vážně by bylo lepší, kdyby...
	AI_Output (other, self, "OUTRO_Schiff_15_03"); //Už o tom nechci slyšet.
	AI_Output (self, other, "OUTRO_Schiff_11_04"); //Slyšel jsem, že se válka se skřety vyvíjí špatně.
	AI_Output (other, self, "OUTRO_Schiff_15_05"); //A?
	AI_Output (self, other, "OUTRO_Schiff_11_06"); //Nejspíš nebude všechno to zlato kde utratit.
	AI_Output (other, self, "OUTRO_Schiff_15_07"); //To zlato zůstane na palubě!
	AI_Output (self, other, "OUTRO_Schiff_12_08"); //K čemu nám bude zlato, když v první bouři půjdeme ke dnu?
	AI_Output (other, self, "OUTRO_Schiff_15_09"); //Ale já žádnou bouři nevidím.
	AI_Output (self, other, "OUTRO_Schiff_12_10"); //Zatím...
	AI_Output (other, self, "OUTRO_Schiff_15_11"); //Klídek! Všechno dobře dopadne!
	
	//ADDON
	AI_Output	(other, self, "DIA_Addon_AddonIntro_15_00"); //(udiveně) ...lidé?
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_01"); //(opovržlivě) Lidé jsou slabí.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_02"); //(opovržlivě) Příliš snadno podléhají pokušením.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_03"); //A tak si obvykle zahrávají se silami, kterým nerozumějí a jež nedokážou ovládat.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_04"); //Ti, kdož ve své víře ještě nezakolísali, už začali bojovat s nepřítelem.
	
	//ADDON - NEU
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_00"); //Po pádu bariéry a osvobození Spáče Beliarův hněv ještě vzrostl.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_01"); //Jak se píše ve starých posvátných knihách, do tohoto světa se vrátí mocný artefakt.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_02"); //(cituje) 'Když bůh temnot vyslal na průzkum své služebníky.'
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_03"); //A právě to se zrovna stalo. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_04"); //To hledání už začalo dávno!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_05"); //Beliarovi služebníci při svém pátrání znesvěcují nejstarší boží svatyně.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_06"); //Beliarovi služebníci znesvěcují nejstarší boží svatyně.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_07"); //A tak se probudili strážci těchto posvátných míst. To jejich hněv otřásá zemí!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_08"); //Ten hněv cítí každý mocnější mág na tomto ostrově. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_09"); //A někteří už se pokusili té hrozbě čelit.
};
