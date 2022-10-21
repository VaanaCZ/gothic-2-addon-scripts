// *********************************
// Sprachausgabe der Video-Sequenzen
// *********************************

func void B_Video()
{
	// ------ Intro ------
	AI_Output (self, other, "INTRO_Xardas_Speech_14_00"); //Un singolo detenuto ha cambiato il destino di migliaia di persone.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_01"); //Ma ha dovuto pagare un prezzo elevato...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_02"); //Ha sconfitto il Dormiente, distrutto la Barriera...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_03"); //...ma mentre tutti gli altri detenuti sono fuggiti, egli è rimasto intrappolato sotto le macerie...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_04"); //Sono stato io a mandarlo a combattere il Dormiente.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_05"); //E sono io ora che lo riporto indietro da lì.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_06"); //Egli è debole e si è dimenticato di molte cose.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_07"); //Ma è vivo...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_08"); //È... tornato!
	
	// ------ Lagerfeuer ------
	AI_Output (self, other, "INTRO_DiegoGorn_12_00"); //(vicino al fuoco) Certo che è ancora vivo. Cosa credevi?
	AI_Output (self, other, "INTRO_DiegoGorn_11_01"); //Speriamo sia così...
	AI_Output (self, other, "INTRO_DiegoGorn_12_02"); //(la terra si muove) Hai sentito?
	AI_Output (self, other, "INTRO_DiegoGorn_11_03"); //Cosa?
	AI_Output (self, other, "INTRO_DiegoGorn_12_04"); //La terra...
	
	
	// ------ Extro ------
	AI_Output (other, self, "Extro_Tempel_15_01"); //(stupito) Xardas! Cosa...
	AI_Output (other, self, "Extro_Tempel_14_02"); //(protesta) Non ora...
	AI_Output (other, self, "Extro_Tempel_14_03"); //(fanaticamente) Sono pronto... Scegli me! Sì...
	AI_Output (other, self, "Extro_Tempel_15_04"); //(fra sé e sé) Dov'è finito?
	
	// ------ Outro ------
	AI_Output (self, other, "OUTRO_Xardas_14_00"); //(ricorda) E l'umano uccise la bestia ed entrò nel regno di Beliar...
	AI_Output (other, self, "OUTRO_Xardas_15_01"); //Xardas! Cos'è successo esattamente al Tempio di Irdorath?
	AI_Output (self, other, "OUTRO_Xardas_14_02"); //Con l'aiuto di Innos, hai annientato l'incarnazione del male.
	AI_Output (self, other, "OUTRO_Xardas_14_03"); //E io ho assunto i suoi poteri...
	AI_Output (self, other, "OUTRO_Xardas_14_04"); //Questo è stato il mio unico scopo da quando ho lasciato il Circolo del Fuoco.
	AI_Output (self, other, "OUTRO_Xardas_14_05"); //Per raggiungerlo, ti ho aiutato a completare il tuo obiettivo.
	AI_Output (self, other, "OUTRO_Xardas_14_06"); //Ciò che mi era stato negato nel Tempio del Dormiente è finalmente accaduto.
	AI_Output (self, other, "OUTRO_Xardas_14_07"); //Beliar ha scelto me.
	AI_Output (other, self, "OUTRO_Xardas_15_08"); //E così ora obbedisci al dio delle tenebre?
	AI_Output (self, other, "OUTRO_Xardas_14_09"); //No. Io non obbedisco a Beliar più di quanto tu obbedisca a Innos!
	AI_Output (self, other, "OUTRO_Xardas_14_10"); //Nemmeno gli dei sanno cos'ha in serbo il destino per noi...
	AI_Output (self, other, "OUTRO_Xardas_14_11"); //E solamente ora sto cominciando a capire quali opportunità io abbia disposizione...
	AI_Output (self, other, "OUTRO_Xardas_14_12"); //Ma una cosa è certa. Ci rincontreremo di nuovo...
	
	// ------ Outro Xardas Kapitän ------
	AI_Output (self, other, "OUTRO_Xardas_04_00"); //(a gran voce) Vattene!
	
	// ------ Drachenangriff ------
	AI_Output (self, other, "Cutscene_Drachen_04_00"); //(vede qualcosa in lontananza) Mmmh?
	AI_Output (self, other, "Cutscene_Drachen_04_01"); //(riflette) Oh, maledizione!
	AI_Output (self, other, "Cutscene_Drachen_04_02"); //(tossisce sofferente, strozzandosi) - (vari)
	AI_Output (self, other, "Cutscene_Drachen_04_03"); //Aaargh! (vari)
	AI_Output (self, other, "Cutscene_Drachen_04_04"); //(prolungato urlo di morte, 4 secondi)
	
	// ------ OrkSturm ------
	AI_Output (self, other, "Cutscene_OrcSturm_04_00"); //Chiudete il cancello!!! (vari)
	AI_Output (self, other, "Cutscene_OrcSturm_04_01"); //Fermateli!!! (vari)
	AI_Output (self, other, "Cutscene_OrcSturm_04_02"); //Aaargh! (vari)
	
	// ------ Outro Credits ------
	AI_Output (self, other, "OUTRO_Schiff_12_00"); //Siamo sovraccarichi. Dobbiamo gettare dell'oro in mare.
	AI_Output (other, self, "OUTRO_Schiff_15_01"); //Giù le mani dall'oro!
	AI_Output (self, other, "OUTRO_Schiff_12_02"); //Ascolta, faremmo meglio a...
	AI_Output (other, self, "OUTRO_Schiff_15_03"); //Non voglio sentire una sola parola in proposito...
	AI_Output (self, other, "OUTRO_Schiff_11_04"); //Ho sentito dire che la guerra con gli orchi sta procedendo male...
	AI_Output (other, self, "OUTRO_Schiff_15_05"); //E allora?
	AI_Output (self, other, "OUTRO_Schiff_11_06"); //Probabilmente non saremo comunque in grado di spendere tutto l'oro da nessuna parte...
	AI_Output (other, self, "OUTRO_Schiff_15_07"); //L'oro rimane a bordo!
	AI_Output (self, other, "OUTRO_Schiff_12_08"); //A che ci serve l'oro se poi finiamo capovolti nella più piccola delle tempeste?
	AI_Output (other, self, "OUTRO_Schiff_15_09"); //Ma io non vedo una tempesta...
	AI_Output (self, other, "OUTRO_Schiff_12_10"); //Non ANCORA...
	AI_Output (other, self, "OUTRO_Schiff_15_11"); //Rilassati! Tutto si sistemerà!
	
	//ADDON
	AI_Output	(other, self, "DIA_Addon_AddonIntro_15_00"); //(stupito) … umani?
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_01"); //(sprezzante) Gli umani sono deboli.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_02"); //(sprezzante) Cedono troppo facilmente alle tentazioni del male.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_03"); //E così si impegolano con poteri che non capiscono e certamente non sanno controllare.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_04"); //Coloro i quali seguono con determinazione la loro fede hanno già cominciato la loro battaglia contro il nemico.
	
	//ADDON - NEU
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_00"); //Dopo il crollo della Barriera e la cacciata del Dormiente, l'ira di Beliar è diventata anche più grande!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_01"); //Un potente artefatto, così è scritto nelle antiche scritture, verrà riportato in questo mondo.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_02"); //(cita) 'Quando il Dio dell'Oscurità invia i suoi seguaci alla ricerca'
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_03"); //Ed è avvenuto proprio questo. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_04"); //Questa ricerca… è cominciata da molto tempo!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_05"); //Con la loro ricerca, i seguaci di Beliar stanno profanando i più antichi templi dedicati agli dei.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_06"); //I seguaci di Beliar stanno profanando i più antichi templi dedicati agli dei.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_07"); //I guardiani di quei luoghi sacri si sono risvegliati. E la loro ira… fa tremare la terra!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_08"); //Ogni mago potente su quest'isola può avvertire quest'ira. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_09"); //E alcuni di loro hanno già cominciato ad affrontare la minaccia.
};
