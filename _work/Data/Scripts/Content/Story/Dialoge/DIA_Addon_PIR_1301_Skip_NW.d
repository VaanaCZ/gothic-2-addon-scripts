
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Skip_NW_EXIT   (C_INFO)
{
	npc         = PIR_1301_Addon_Skip_NW;
	nr          = 999;
	condition   = DIA_Addon_Skip_NW_EXIT_Condition;
	information = DIA_Addon_Skip_NW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Skip_NW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Skip_NW_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	PlayerTalkedToSkipNW = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Hallo		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Skip_NW_Hallo_Condition;
	information	 = 	DIA_Addon_Skip_NW_Hallo_Info;
	important	 = 	TRUE;
};
func int DIA_Addon_Skip_NW_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_00"); //(irritato) Sei arrivato, finalmente. Sono ore che ti aspetto.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_01"); //(confuso) Aspetta un attimo. Tu non sei un mercante, vero?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_02"); //(arrabbiato) Dov'è Baltram?
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_WerBistDu		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_WerBistDu_Condition;
	information	 = 	DIA_Addon_Skip_NW_WerBistDu_Info;

	description	 = 	"Chi sei?";
};

func int DIA_Addon_Skip_NW_WerBistDu_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_WerBistDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_00"); //Chi sei?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_01"); //Non vedo come la cosa possa interessarti. Ma se proprio ci tieni a saperlo, mi chiamo Skip. Ti dice qualcosa?
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_02"); //(fingendo di non capire) Chi?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_03"); //Vorresti dirmi che non hai mai sentito parlare di Skip? Ma dove vivi, idiota?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_04"); //Sono uno dei criminali più ricercati di tutta Khorinis. Io e i miei ragazzi siamo il terrore delle acque che circondano questo schifo di isola.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_05"); //(indignato) Avanti, devi aver sentito parlare di me!
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Sei un pirata.", DIA_Addon_Skip_NW_WerBistDu_pirat );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Dovrei conoscerti?", DIA_Addon_Skip_NW_WerBistDu_keineAhnung );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Ma certo. Ora mi ricordo.", DIA_Addon_Skip_NW_WerBistDu_ja );
};
func void DIA_Addon_Skip_NW_WerBistDu_ja ()
{
	AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_00"); //Ma certo. Ora mi ricordo.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_01"); //(perplesso) Dici davvero? Non hai mai sentito parlare di me?
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_02"); //Oh, cavolo! E io che pensavo di fare un salto in città!
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_03"); //Meno male che non l'ho fatto.

	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_04"); //La milizia mi avrebbe messo in gattabuia all'istante.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_05"); //Non sei mica venuto per arrestarmi, per caso?
		AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_06"); //Beh...
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_07"); //Buon per te. Non metterti contro Skip se non vuoi finir male.
	};
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00"); //Dovrei conoscerti?
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01"); //Bada a quel che dici, o il vecchio Skip ti darà la lezione che meriti.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_pirat_15_00"); //Sei un pirata.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_01"); //(irritato) Sì, dannazione. Non si vede?! E un pirata furioso, per giunta.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_02"); //Mi annoio tanto che morderei le assi della nave.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};
///////////////////////////////////////////////////////////////////////
//	Info Baltram
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Baltram		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Baltram_Condition;
	information	 = 	DIA_Addon_Skip_NW_Baltram_Info;

	description	 = 	"Baltram? Stai aspettando un mercante?";
};

func int DIA_Addon_Skip_NW_Baltram_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Baltram_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Baltram_15_00"); //Baltram? Stai aspettando un mercante?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_01"); //Sei sveglio, eh?
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_02"); //Te l'ho appena detto!
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_03"); //Sembra che quel venditore di paccottiglia si sia scordato di me.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_04"); //Se solo ce l'avessi tra le mani...
	
	Log_CreateTopic (TOPIC_Addon_BaltramSkipTrade, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BaltramSkipTrade, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"Il pirata Skip mi ha detto che il mercante cittadino Baltram ha fatto affari con i pirati."); 
	
	SCKnowsBaltramAsPirateTrader = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info BaltramPaket
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_BaltramPaket		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_BaltramPaket_Condition;
	information	 = 	DIA_Addon_Skip_BaltramPaket_Info;

	description	 = 	"Ho un pacco per te, da parte di Baltram.";
};

func int DIA_Addon_Skip_BaltramPaket_Condition ()
{
	if (MIS_Addon_Baltram_Paket4Skip == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_00"); //Ho un pacchetto per te, da parte di Baltram.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_01"); //Cosa? Mi ha mandato un fattorino?
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_02"); //Cos'è, se la fa sotto per la paura? Oh beh. Che vuoi aspettarti da un taccagno come quello.
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_03"); //Dice che in cambio vuole 3 bottiglie del tuo rum.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_04"); //(ride) Gli piacerebbe, eh? Non solo mi fa aspettare per un secolo e non ha neppure la decenza di presentarsi di persona, avanza pure pretese.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_05"); //Tieni, dagli 2 bottiglie. Bastano e avanzano.
	CreateInvItems (self, ItFo_Addon_Rum, 2);									
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);

	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Woher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Woher		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Woher_Condition;
	information	 = 	DIA_Addon_Skip_NW_Woher_Info;

	description	 = 	"Da dove venite?";
};

func int DIA_Addon_Skip_NW_Woher_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_WerBistDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Woher_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Woher_15_00"); //Da dove vieni?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_01"); //Vuoi sapere dov'è il nostro nascondiglio?

	if (hero.guild == GIL_MIL)
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_02"); //Figurati se lo direi mai a un miliziano!
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_03"); //Tanto varrebbe che mi costituisssi!
	};

	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_04"); //E poi comunque non riusciresti a trovarci lo stesso.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_05"); //L'isola di Khorinis è vasta, e nessuno arriva mai dove siamo noi, a meno che non abbia un'imbarcazione di qualche tipo.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_06"); //E poi dovresti anche sapere come muoverti tra le scogliere. Solo chi conosce il sentiero segreto riesce ad attraversarle.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_07"); //Solo due persone conoscono il sentiero segreto, e tu non sei una di loro.
};


///////////////////////////////////////////////////////////////////////
//	Info SCSawGreg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_SCSawGreg		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_SCSawGreg_Condition;
	information	 = 	DIA_Addon_Skip_SCSawGreg_Info;

	description	 = 	"Conosci un tizio con una benda sull'occhio?";
};

func int DIA_Addon_Skip_SCSawGreg_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (SC_KnowsConnectionSkipGreg == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_SCSawGreg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_00"); //Conosci un tizio con una benda sull'occhio?
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_01"); //C'è un sacco di gente con una benda sull'occhio.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_02"); //C'è un tizio che viaggia per tutta Khorinis e che sembra conoscerti bene.
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_03"); //Non so chi sia. Non ho rapporti con la gente di terra.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_04"); //Ma...
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_05"); //Lascia perdere, non mi interessa proprio.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_MissingPeople		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_MissingPeople_Condition;
	information	 = 	DIA_Addon_Skip_NW_MissingPeople_Info;

	description	 = 	"Tantissimi cittadini sono scomparsi.";
};

func int DIA_Addon_Skip_NW_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_MissingPeople_15_00"); //Numerosi cittadini sono scomparsi, e tutto sembra suggerire che tu sia coinvolto nella faccenda.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_01"); //(sentendosi smascherato) Ehm... Maledizione, non è come pensi.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_02"); //Ti sembro un mercante di schiavi, per caso? No, io mi limito alle merci. Di che tipo e provenienza, non mi riguarda affatto.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_03"); //Abbiamo trasportato ogni genere di roba per quei porci.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_04"); //All'inizio erano merci normali... Beh, sì, a volte di contrabbando.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_05"); //Ma poi hanno cominciato a rapire gli abitanti della città. Non ho idea di cosa intendano farsene.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_06"); //Noi li abbiamo solo traghettati.
};
///////////////////////////////////////////////////////////////////////
//	Info Dexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Dexter		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_Dexter_Condition;
	information	 = 	DIA_Addon_Skip_NW_Dexter_Info;

	description	 = 	"Di chi stai parlando?";
};

func int DIA_Addon_Skip_NW_Dexter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Dexter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Dexter_15_00"); //Di chi stai parlando?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_01"); //Ma dei briganti, naturalmente. Chi altri? Quei manigoldi che fanno i loro porci comodi su tutta l'isola.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_02"); //E non solo qui, intorno a Khorinis.
};


func void B_Skip_SaysDextersName ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_SaysDextersName_08_00"); //Ora ricordo il suo nome! Dexter. Sì, mi pare si chiamasse Dexter.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Il capitano dei briganti, Dexter, ha fatto condurre via con la forza i cittadini di Khorinis. Pare che Dexter si trovi da qualche parte a sud della fattoria di Onar."); 

	SC_KnowsDexterAsKidnapper = TRUE;			
	Ranger_SCKnowsDexter = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Name
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Name		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_Name_Condition;
	information	 = 	DIA_Addon_Skip_NW_Name_Info;

	description	 = 	"Per me 'briganti' non è abbastanza: voglio un nome...";
};

func int DIA_Addon_Skip_NW_Name_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Dexter))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Name_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_00"); //Non mi basta che tu mi parli di 'briganti'. Voglio un nome...
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_01"); //Vuoi sapere chi è il capo dei briganti? Accidenti, non me lo ricordo... Com'è che si chiamava quel bastardo?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_02"); //Mmm... Non riesco a ricordarmi il suo nome. Eppure non era complicato.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_03"); //Ma posso mostrarti dove trovare il capo della banda in questa parte di Khorinis.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_04"); //Hai una mappa decente?
	
	if (Npc_HasItems (other,ItWr_Map_NewWorld) == FALSE)
	{
		if (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Shrine_MIS) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Caves_MIS) == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_05"); //Ho una mappa proprio qui.
			AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_06"); //Ma qualcuno l'ha già scarabocchiata. Che piacere ci sarebbe a scriverci sopra?
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_07"); //No.
		};
		
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_08"); //Allora dovrai accontentarti di una descrizione.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_09"); //C'è una grossa fattoria a est, credo che appartenga a un certo Onar.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_10"); //Quel tizio possiede dei vasti appezzamenti di terreno. A sud di quei campi, c'è una fortezza che sorge su una rupe.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_11"); //Lì troverai il tuo uomo.
		B_Skip_SaysDextersName ();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Landkarte
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Landkarte		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Landkarte_Condition;
	information	 = 	DIA_Addon_Skip_NW_Landkarte_Info;

	description	 = 	"Ecco. Ho una mappa di Khorinis.";
};

func int DIA_Addon_Skip_NW_Landkarte_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Name))
	&& (Npc_HasItems (other,ItWr_Map_NewWorld))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Landkarte_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Landkarte_15_00"); //Ecco, ho una mappa di Khorinis.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_01"); //Ti segnerò la posizione del nascondiglio di quel tizio.
	B_GiveInvItems (other, self, ItWr_Map_NewWorld,1);
	B_Skip_SaysDextersName ();
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_02"); //Ecco la tua mappa.
	
	Npc_RemoveInvItems	(self,ItWr_Map_NewWorld ,1 );
	CreateInvItems (self, ItWr_Map_NewWorld_Dexter, 1);									
	B_GiveInvItems (self, other, ItWr_Map_NewWorld_Dexter, 1);		
};

///////////////////////////////////////////////////////////////////////
//	Info Wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Wohin		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Skip_NW_Wohin_Condition;
	information	 = 	DIA_Addon_Skip_NW_Wohin_Info;
	permanent	 = 	TRUE;

	description	 = 	"Dove hai portato quella gente?";
};

func int DIA_Addon_Skip_NW_Wohin_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Wohin_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Wohin_15_00"); //Dove hai portato quella gente?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Wohin_08_01"); //Te l'ho detto, non ti rivelerò la posizione del nostro accampamento.
};
