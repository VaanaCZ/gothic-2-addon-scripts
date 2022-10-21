// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Skip_EXIT(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 999;
	condition	= DIA_Addon_Skip_EXIT_Condition;
	information	= DIA_Addon_Skip_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Skip_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Skip_PICKPOCKET (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 900;
	condition	= DIA_Addon_Skip_PICKPOCKET_Condition;
	information	= DIA_Addon_Skip_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Skip_PICKPOCKET_Condition()
{
	C_Beklauen (20, 43);
};
 
FUNC VOID DIA_Addon_Skip_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Skip_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Skip_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Skip_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
	
func void DIA_Addon_Skip_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Skip_Hello(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Hello_Condition;
	information	= DIA_Addon_Skip_Hello_Info;

	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& PlayerTalkedToSkipNW == TRUE
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_00"); //Chi incrocia nuovamente il sentiero del vecchio Skip?
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_01"); //(esagerato) Io ti conosco!
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_02"); //La baia vicino alla città, ricordi?
	AI_Output (other,self ,"DIA_Addon_Skip_Hello_15_03"); //Skip, giusto?
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_04"); //(orgoglioso) Vedo che non mi hai dimenticato.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_05"); //Ma ho visto la tua faccia DA QUALCHE ALTRA PARTE...
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_06"); //Ma certo!
	B_UseFakeScroll ();
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_07"); //Oh beh, non ti somiglia molto, ma sei sicuramente TU.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_08"); //Non te la prendere, anche il mio manifesto di ricercato fa schifo.
	Npc_ExchangeRoutine	(self,"Start");
};

// ************************************************************
// 			  			 Baltrams Paket
// ************************************************************
instance DIA_Addon_SkipADW_BaltramPaket		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 2;
	condition	= DIA_Addon_SkipADW_BaltramPaket_Condition;
	information	= DIA_Addon_SkipADW_BaltramPaket_Info;

	description	= "Ho un pacco per te, da parte di Baltram.";
};
func int DIA_Addon_SkipADW_BaltramPaket_Condition ()
{
	if (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_SkipADW_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_SkipADW_BaltramPaket_15_00"); //Ho un pacco per te, da parte di Baltram.
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_01"); //(sorridendo) A quel tizio il nostro rum deve piacere tanto se ci porta le sue merci fin QUI.
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_02"); //Tieni, dagli queste 2 bottiglie di rum. La terza me la sono scolata io mentre l'aspettavo.
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

// ************************************************************
// 			  			Was machst du hier?
// ************************************************************
INSTANCE DIA_Addon_Skip_Job(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 3;
	condition	= DIA_Addon_Skip_Job_Condition;
	information	= DIA_Addon_Skip_Job_Info;

	description = "Cosa stai facendo, qui?";
};                       
FUNC INT DIA_Addon_Skip_Job_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_Job_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Job_15_00"); //Cosa stai facendo qui?
	AI_Output (self ,other, "DIA_Addon_Skip_Job_08_01"); //Sono appena tornato da Khorinis e ora aspetto che Greg ritorni.
};

// ************************************************************
// 			  			Greg getroffen!
// ************************************************************
instance DIA_Addon_Skip_ADW_GregGetroffen		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 4;
	condition	= DIA_Addon_Skip_ADW_GregGetroffen_Condition;
	information	= DIA_Addon_Skip_ADW_GregGetroffen_Info;

	description	= "Ho visto Greg a Khorinis.";
};
func int DIA_Addon_Skip_ADW_GregGetroffen_Condition ()
{
	if (PlayerTalkedToGregNW  == TRUE)
	&& (GregIsBack == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Job))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ADW_GregGetroffen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ADW_GregGetroffen_15_00"); //Ho visto Greg a Khorinis.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_01"); //Davvero? Dannazione! Qualcosa dev'essere andato storto.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_02"); //Avrebbe già dovuto essere qui con la nostra nave.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_03"); //(pensieroso) Penso che dovrei tornare a Khorinis e aspettarlo lì...
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_04"); //(sospira) Ma certamente non oggi. Sono appena arrivato.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  			Überfahrt - PERM
// ************************************************************
var int Skip_Transport_Variation;
// ------------------------------------------------------------
instance DIA_Addon_Skip_Transport(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 99;
	condition	= DIA_Addon_Skip_Transport_Condition;
	information	= DIA_Addon_Skip_Transport_Info;
	permanent	= TRUE;
	description = "Puoi portarmi a Khorinis?";
};                       
FUNC INT DIA_Addon_Skip_Transport_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Job))
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Skip_Transport_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Transport_15_00"); //Puoi portarmi a Khorinis?
	if (GregIsBack == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_01"); //No. Non vado via, per ora. Prima devo scolarmi un po' di grog decente.
	}
	else if (Skip_Transport_Variation == 0)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_02"); //Sei pazzo? Abbiamo perso la nostra NAVE, amico!
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_03"); //Non ho intenzione di rischiare la nostra ultima imbarcazione solo perché tu sei troppo pigro per andare a Khorinis DA SOLO!
		Skip_Transport_Variation = 1;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_04"); //Per l’ultima volta: NO!
	};
};

// ************************************************************
// 			 			Banditen + Rüstung
// ************************************************************
// ------------------------------------------------------------
// 							About Bandits
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Bandits(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Bandits_Condition;
	information	= DIA_Addon_Skip_Bandits_Info;

	description = "Cosa puoi dirmi dei briganti?";
};                       
FUNC INT DIA_Addon_Skip_Bandits_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Skip_Bandits_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Bandits_15_00"); //Cosa puoi dirmi dei briganti?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_01"); //I briganti?! Ci stanno ATTACCANDO!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_02"); //Perché credi che stiamo costruendo la palizzata?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_03"); //Siamo stati noi a portare qui quella feccia.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_04"); //Una volta commerciavano con loro. Fattelo dire, hanno più oro di quanto possano mai spenderne!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_05"); //Avrebbero pagato qualsiasi cifra per una bottiglia di rum.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_06"); //Ma ora siamo in guerra!
	AI_Output (other, self, "DIA_Addon_Erol_Bandits_15_06"); //Cosa è successo?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_07"); //Quei bastardi non avevano pagato l'ultima consegna.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_08"); //Così sono andato a vedere che ne era stato del nostro oro.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_09"); //Ma alla palude quei porci mi hanno attaccato!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_10"); //E non è tutto... Hanno ucciso Angus e Hank! Due dei nostri uomini migliori.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_11"); //Dammi retta, sta' lontano dalla palude.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_12"); //Attaccheranno chiunque non abbia un aspetto trasandato come il loro.
	
	
};

// ------------------------------------------------------------
// 						Banditenrüstung
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_ArmorPrice(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_ArmorPrice_Condition;
	information	= DIA_Addon_Skip_ArmorPrice_Info;

	description = "Mi servono delle armature da brigante!";
};                       
FUNC INT DIA_Addon_Skip_ArmorPrice_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};
func VOID DIA_Addon_Skip_ArmorPrice_Info()
{	
	AI_Output (other,self , "DIA_Addon_Skip_ArmorPrice_15_00"); //Mi serve l'armatura di un brigante.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_01"); //Vuoi entrare nel loro campo? Ma sei pazzo? 
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_02"); //Una volta che scopriranno che non sei uno di loro, sarai carne da macello!
	AI_Output (other, self, "DIA_Addon_Skip_ArmorPrice_15_02"); //Hai idea di dove potrei trovare un'armatura del genere?
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_03"); //(sospira) Non ti arrendi facilmente, eh? Va bene. Avevamo un'armatura, una volta.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_04"); //Dev'essere ancora da qualche parte nella capanna di Greg.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_05"); //Forse puoi chiedergli di vendertela, quando torna...
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Skip suppone che l'armatura sia nella capanna di Greg."); 
};

// ------------------------------------------------------------
// 						In Gregs Hütte
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GregsHut(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_GregsHut_Condition;
	information	= DIA_Addon_Skip_GregsHut_Info;
	permanent	= FALSE;
	description = "Puoi dirmi come entrare nella capanna di Greg?";
};                       
FUNC INT DIA_Addon_Skip_GregsHut_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_ArmorPrice))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_GregsHut_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_GregsHut_15_00"); //Come posso entrare nella sua capanna?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_01"); //Ehi, amico, frena!
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_02"); //Non penserai mica di saccheggiare la roba di Greg, eh?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_03"); //Quando se n'è andato ha affidato la chiave a Francis dicendogli di non far entrare NESSUNO.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Francis ha la chiave della capanna di Greg. Gli è stato ordinato di non lasciare entrare nessuno."); 
	
	Knows_GregsHut = TRUE;
};

// ------------------------------------------------------------
//					Über Francis --> Samuel
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Francis (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Francis_Condition;
	information	= DIA_Addon_Skip_Francis_Info;
	permanent	= FALSE;
	description = "Cosa puoi dirmi di Francis?";
};   
FUNC INT DIA_Addon_Skip_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Francis_15_00"); //Cosa puoi dirmi di Francis?
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_01"); //È il nostro tesoriere.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_02"); //Il Capitano si fida di lui. Per questo gli ha affidato il comando.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_03"); //Ma nessuno dei ragazzi lo prende sul serio.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_04"); //Se vuoi saperne di più, parla con Samuel.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_05"); //Credo che sia ancora nella piccola caverna a nord.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_06"); //Samuel conosce vita, morte e miracoli di tutti, qui...
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Dovrei parlare a Samuel. Forse può aiutarmi."); 
};
	
	
// ************************************************************
// 						Die Turmbanditen
// ************************************************************
// ------------------------------------------------------------
// 			 				Raven
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Raven(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_Raven_Condition;
	information	= DIA_Addon_Skip_Raven_Info;
	permanent	= FALSE;
	description = "Hai mai incontrato Raven?";
};                       
FUNC INT DIA_Addon_Skip_Raven_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits) == TRUE)
	{
		return TRUE;
	};			
};
FUNC VOID DIA_Addon_Skip_Raven_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Raven_15_00"); //Hai mai incontrato Raven?
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_01"); //Certamente. Mentre ero al cancello con Henry, ho visto Raven collocare alcuni dei suoi uomini presso la torre a sud.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_02"); //A un tiro di schioppo dal nostro accampamento. (ride) Immagino siano qui per spiarci.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_03"); //E ho visto come tratta i suoi quando gli disobbediscono.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_04"); //Chiunque non obbedisca alla lettera ai suoi ordini farà una brutta fine.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_05"); //Dammi retta: gira al largo da Raven.
};



// ************************************************************
// ***														***
// 						Die Angus und Hank Show
// ***														***
// ************************************************************

// ------------------------------------------------------------
// 			 			Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHank(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHank_Condition;
	information	= DIA_Addon_Skip_AngusHank_Info;

	description = "Parlami ancora di Angus e Hank.";
};                       
FUNC INT DIA_Addon_Skip_AngusHank_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_AngusnHank_15_00"); //Parlami ancora di Angus e Hank.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_01"); //Angus e Hank dovevano incontrarsi con certi briganti di fronte all'accampamento.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_02"); //Avevano con sé tutte le provviste che quei bastardi ci avevano ordinato.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_03"); //Acciaio forgiato, grimaldelli e quant'altro. 
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_04"); //Ma non sono mai tornati. Quei porci devono averli ammazzati!
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_05"); //Morgan e Bill sono usciti a cercarli, ma senza alcun successo.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_06"); //Bill era molto a terra. Erano entrambi suoi amici.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_07"); //È ancora giovane, e queste cose lo feriscono.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_08"); //Noi altri l'abbiamo presa meglio. Possiamo permetterci di perdere le merci. (sospira) Ma il grog che trasportavano...
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_09"); //(arrabbiato) Saranno almeno 20 bottiglie!
	MIS_ADDON_SkipsGrog = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_SkipsGrog,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_SkipsGrog,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"A quanto si dice, Skip ha perso 20 bottiglie di grog coi briganti. Ora le rivuole.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"Angus e Hank avrebbero dovuto incontrare un paio di briganti. Nessuno li ha più rivisti.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"La ricerca di Morgan e Bill non ha ancora portato risultati.");
};

// ------------------------------------------------------------
// 			 		Angus und Hank sind TOT
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankDead(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankDead_Condition;
	information	= DIA_Addon_Skip_AngusHankDead_Info;
	permanent	= FALSE;
	description = "A proposito di Angus e Hank…";
};                       
FUNC INT DIA_Addon_Skip_AngusHankDead_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	&& (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankDead_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_00"); //Riguardo Angus e Hank ...
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_01"); //Cosa?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_01"); //Li ho trovati.
	//AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_02"); //Sie sind tot, richtig?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_03"); //Sono morti.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_03"); //(tra sé e sé) Morti stecchiti, poveri diavoli!
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_04"); //Beh, c'era da aspettarselo.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_05"); //Dillo a Bill, se non l'hai ancora fatto.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_06"); //Ma fallo con tatto, è ancora giovane.
};

// ------------------------------------------------------------
// 			 			Kenne den Mörder
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankMurder(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankMurder_Condition;
	information	= DIA_Addon_Skip_AngusHankMurder_Info;
	permanent	= FALSE;
	description = "So chi ha ucciso Angus e Hank.";
};                       
FUNC INT DIA_Addon_Skip_AngusHankMurder_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_AngusHankDead))
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankMurder_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_JuanMurder_15_00"); //So chi ha ucciso Angus e Hank.
	if (MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_01"); //Buon per te. Sono morti, a chi vuoi che importi ora?
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_02"); //La vendetta non ha mai arricchito nessuno.
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_03"); //A me interessa solo riavere il mio grog.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_04"); //Non mi interessa chi li ha uccisi. Dov'è il mio grog?!
	};
};

// ------------------------------------------------------------
// 							Grog zurück
// ------------------------------------------------------------
instance DIA_Addon_Skip_Grog		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 9;
	condition	= DIA_Addon_Skip_Grog_Condition;
	information	= DIA_Addon_Skip_Grog_Info;
	permanent	= TRUE;
	description	= "A proposito del grog…";
};
func int DIA_Addon_Skip_Grog_Condition ()
{
	if (MIS_ADDON_SkipsGrog == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_Grog_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_00"); //Riguardo al grog...
		
	if (Npc_HasItems (other,Itfo_Addon_Grog)>= 20)
	{
		Info_ClearChoices	(DIA_Addon_Skip_Grog);
		Info_AddChoice	(DIA_Addon_Skip_Grog, DIALOG_BACK, DIA_Addon_Skip_Grog_back );
		Info_AddChoice	(DIA_Addon_Skip_Grog, "Eccoti le 20 bottiglie.", DIA_Addon_Skip_Grog_geben );
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_01"); //Te ne mancano 20 bottiglie, giusto?
		AI_Output	(self, other, "DIA_Addon_Skip_Grog_08_02"); //Sì, dannazione. L'intera scorta.
	};
};
func void DIA_Addon_Skip_Grog_back ()
{
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_00"); //Eccoti le tue 20 bottiglie.
	B_GiveInvItems (other, self, Itfo_Addon_Grog, 20);
	
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Skip ha riavuto le 20 bottiglie di grog ed è molto contento.");
	
	MIS_ADDON_SkipsGrog = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_SkipsGrog);

	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_01"); //Cosa? Davvero? E me le dai così?
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_02"); //Beh...
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_03"); //D'accordo. Te le pagherò.
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_04"); //Non hai qualcosa di più interessante dell'oro?
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_05"); //Mmm... Vediamo... Ho quest'anello.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_06"); //L'ho vinto al gioco in una bettola del porto, anni fa.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_07"); //All'epoca, il tizio mi disse che era magico, ma non so se sia vero.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_08"); //Preferisci questo invece del denaro?
	
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Dammi il denaro.", DIA_Addon_Skip_Grog_gold );
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Dammi l'anello.", DIA_Addon_Skip_Grog_ring );
};
func void DIA_Addon_Skip_Grog_ring ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_ring_15_00"); //Dammi l'anello.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_ring_08_01"); //Tieni.
	B_GiveInvItems (self, other, ItRi_Prot_Edge_02, 1);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_gold ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_gold_15_00"); //Dammi il denaro.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_gold_08_01"); //Va bene.
	var int GrogKohle;
	GrogKohle = (Value_Grog * 20);
	B_GiveInvItems (self, other, ItMi_Gold, GrogKohle);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};



// ************************************************************
// 			  				TRADE 
// ************************************************************
INSTANCE DIA_Addon_Skip_News(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 888;
	condition	= DIA_Addon_Skip_News_Condition;
	information	= DIA_Addon_Skip_News_Info;
	permanent	= FALSE;
	description = "Hai qualcosa da vendere?";
};                       
FUNC INT DIA_Addon_Skip_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_News_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_News_15_00"); //Hai qualcosa da vendere?
	AI_Output (self ,other,"DIA_Addon_Skip_News_08_01"); //Se vuoi fare acquisti va' da Garrett. È il responsabile delle scorte.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Anheuern(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 11;
	condition	= DIA_Addon_Skip_Anheuern_Condition;
	information	= DIA_Addon_Skip_Anheuern_Info;
	permanent	= FALSE;
	description = "Devi aiutarmi.";
};                       
FUNC INT DIA_Addon_Skip_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Anheuern_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_00"); //Hai il compito di aiutarmi.
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_01"); //A far cosa?
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_01"); //ll canyon aspetta.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_02"); //Vedo che hai preso alcuni dei ragazzi. Hai fatto bene! 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_03"); //Farai meglio a portare con te qualcuno!
	};
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_04"); //Quel canyon è un inferno!
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Skip_ComeOn(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr		 	= 12;
	condition	= DIA_Addon_Skip_ComeOn_Condition;
	information	= DIA_Addon_Skip_ComeOn_Info;
	permanent	= TRUE;
	description	= "Vieni con me.";
};
func int DIA_Addon_Skip_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ComeOn_15_00"); //Vieni con me.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_02"); //Aspetta. Torniamo nel canyon prima...
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_01"); //Andiamo!
		if (C_BodyStateContains (self, BS_SIT))
		{
			AI_StandUp (self);
			B_TurnToNpc (self,other);
		};
		AI_StopProcessInfos (self);
		
		B_Addon_PiratesFollowAgain();
		
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GoHome(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 13;
	condition	= DIA_Addon_Skip_GoHome_Condition;
	information	= DIA_Addon_Skip_GoHome_Info;
	permanent	= TRUE;
	description = "Non mi servi più.";
};                       
FUNC INT DIA_Addon_Skip_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Skip_GoHome_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_GoHome_15_00"); //Non mi servi più.
	AI_Output (self, other, "DIA_Addon_Skip_GoHome_08_01"); //Beh, allora questo è quanto. Mi troverai all'accampamento.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_TooFar(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 14;
	condition	= DIA_Addon_Skip_TooFar_Condition;
	information	= DIA_Addon_Skip_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_TooFar_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_01"); //Basta così!
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_02"); //Se vuoi proseguire, non contare su di noi!
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_03"); //Se vuoi proseguire, non contare su di me!
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Oase = Treffpunkt
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Treffpunkt (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Treffpunkt_Condition;
	information	= DIA_Addon_Skip_Treffpunkt_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Treffpunkt_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_TELEPORT_PATH_06") <= 800)
	&& (C_AllCanyonRazorDead() == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Treffpunkt_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_00"); //Casomai dovessimo perderci, ci ritroviamo qui all'abbeveratoio.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_02"); //Proseguiamo!
		
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 				Orks!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Orks (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Orks_Condition;
	information	= DIA_Addon_Skip_Orks_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Orks_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Orks_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_01"); //Orchi! Odio quelle bestie!

	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Alle Razor tot
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AllRazorsDead (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_AllRazorsDead_Condition;
	information	= DIA_Addon_Skip_AllRazorsDead_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_AllRazorsDead_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_AllCanyonRazorDead() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_AllRazorsDead_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_03"); //Abbiamo eliminato tutti i cinghiali.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_04"); //Se vuoi possiamo continuare ad esplorare i paraggi.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_05"); //Purché restiamo nel canyon. 
	
	AI_StopProcessInfos (self); 
};


