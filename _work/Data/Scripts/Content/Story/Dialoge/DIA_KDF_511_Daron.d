FUNC VOID B_DaronSegen ()
{
	Daron_Segen = TRUE;

	var string concatText;
	
	var int Bonus_1;
	var int Bonus_2;
	var int Bonus_3;

	if (Daron_Spende < 100)
	{
		if other.attribute[ATR_HITPOINTS] <  other.attribute[ATR_HITPOINTS_MAX]
		{
			other.attribute [ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
		};
	}	 	
	else if (Daron_Spende < 250)
	&&		(Bonus_1 == FALSE)
	{
		B_RaiseAttribute (other, ATR_MANA_MAX, 2);
		
		other.attribute[ATR_MANA] =  other.attribute[ATR_MANA_MAX];
				
		Bonus_1 = TRUE;
	}
	else if (Daron_Spende < 500)
	&&		(Bonus_2 == FALSE)
	{
		B_GivePlayerXP (XP_Ambient);
		Bonus_2 = TRUE;
	}
	else if (Daron_Spende >= 750) 	
	&&		(Daron_Spende < 1000) 	
	&& 		(Bonus_3 == FALSE)
	{
		other.lp = (other.lp + 1);
		
		concatText = ConcatStrings(PRINT_LearnLP, IntToString(1));
		PrintScreen	(concatText, -1, -1, FONT_SCREEN, 2);
		Bonus_3 = TRUE;
	}
	else 
	{
		other.attribute[ATR_HITPOINTS] =  other.attribute[ATR_HITPOINTS_MAX];
		other.attribute[ATR_MANA] =  other.attribute[ATR_MANA_MAX];

		other.attribute[ATR_HITPOINTS_MAX] = (other.attribute[ATR_HITPOINTS_MAX] + 5);
		
		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX, IntToString(5));
		PrintScreen	(concatText, -1, -1, FONT_Screen, 2);
	};
};
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Daron_EXIT(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 999;
	condition	= DIA_Daron_EXIT_Condition;
	information	= DIA_Daron_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Daron_EXIT_Condition()
{
	
	return TRUE;
};
FUNC VOID DIA_Daron_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				  Hallo 
// ************************************************************
INSTANCE DIA_Daron_Hallo(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_Hallo_Condition;
	information	= DIA_Daron_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Daron_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Daron_Hallo_10_00");//Cosa posso fare per te? Stai cercando conforto spirituale?
	AI_Output (self, other,"DIA_Daron_Hallo_10_01");//Vuoi rivolgere una preghiera al nostro Signore Innos o donare dell'oro per la sua chiesa?
};

// ************************************************************
// 			  	Oberes Viertel - Paladine 
// ************************************************************
INSTANCE DIA_Daron_Paladine(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_Paladine_Condition;
	information	= DIA_Daron_Paladine_Info;
	permanent	= FALSE;
	description = "Devo parlare con i paladini...";
};                       
FUNC INT DIA_Daron_Paladine_Condition()
{	
	if (other.guild != GIL_KDF)
	&& (Kapitel < 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Paladine_Info()
{	
	AI_Output (other, self,"DIA_Daron_Paladine_15_00");//Devo parlare con i paladini. Puoi aiutarmi a raggiungerli?
	AI_Output (self, other,"DIA_Daron_Paladine_10_01");//Beh, devi accedere alla parte alta della città. Ad ogni modo, ciò è permesso solo ai cittadini e alle guardie.
	AI_Output (self, other,"DIA_Daron_Paladine_10_02");//E, ovviamente, a noi maghi del fuoco.
	AI_Output (other, self,"DIA_Daron_Paladine_15_03");//Come faccio a diventare un mago del fuoco?
	AI_Output (self, other,"DIA_Daron_Paladine_10_04");//Devi unirti al nostro ordine come novizio. Dopo che avrai prestato servizio per un po' di tempo, forse verrai accettato fra le fila dei maghi.
	AI_Output (self, other,"DIA_Daron_Paladine_10_05");//Ad ogni modo, la strada dell'accettazione è lunga e piena di duro lavoro e studio.
};

// ************************************************************
// 			  				About Segen 
// ************************************************************
INSTANCE DIA_Daron_AboutSegen (C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_AboutSegen_Condition;
	information	= DIA_Daron_AboutSegen_Info;
	permanent	= FALSE;
	description = "Sono venuto per avere la tua benedizione!";
};                       
FUNC INT DIA_Daron_AboutSegen_Condition()
{	
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Player_IsApprentice == APP_NONE)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_AboutSegen_Info()
{	
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_00"); //Sono venuto per prendere la tua benedizione!
	AI_Output (self, other,"DIA_Daron_AboutSegen_10_01"); //Molto bene, molto bene, allora vorrai probabilmente donare dell'oro alla sacra chiesa di Innos, non è così?
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_02"); //A dire il vero volevo la tua benedizione così che possa prestare servizio come apprendista nella parte bassa della città...
	if (Daron_Segen == TRUE)
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_03"); //Ma io ti ho già dato la mia benedizione, figliolo!
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_04"); //Vai con Innos, figliolo!
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_05"); //Ma, figliolo! Senza una modesta offerta alla chiesa, non posso benedirti.
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_06"); //In quale altro modo potrei essere certo delle tue buone intenzioni verso la sacra chiesa di Innos?
	};
};

// ************************************************************
// 			  		Spenden
// ************************************************************
INSTANCE DIA_Daron_Spenden(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 3;
	condition	= DIA_Daron_Spenden_Condition;
	information	= DIA_Daron_Spenden_Info;
	permanent	= FALSE;
	description	= "A quanto ammonta solitamente una donazione, da queste parti?";
};                       
FUNC INT DIA_Daron_Spenden_Condition()
{	if (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Spenden_Info()
{	
	AI_Output (other, self,"DIA_Daron_Spenden_15_00");//A quanto ammonta solitamente una donazione, da queste parti?
	AI_Output (self, other,"DIA_Daron_Spenden_10_01");//Beh, dipende dalla percentuale che vuoi donare. Fammi vedere quanto hai.
	AI_Output (self, other,"DIA_Daron_Spenden_10_02");//(guarda nel tuo borsello) Mmmh mmh...
	
	if (Npc_HasItems (other, ItMi_Gold) < 10)
	{
		AI_Output (self, other,"DIA_Daron_Spenden_10_03");//Mmmh, sei un'anima povera, non è vero? Tieniti quel poco che hai.
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron il Mago del Fuoco non mi ha benedetto. Immagino che questo significhi che devo racimolare un po' di denaro e fare un'offerta, se voglio ottenere la sua benedizione.");
		};
	}
	else //Gold >= 10
	{
		if (Npc_HasItems (other, ItMi_Gold) < 50)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_04");//Beh, non hai molto, ma non sei nemmeno povero. Ci accontentiamo di poco, 10 monete d'oro basteranno.
			B_GiveInvItems (other, self, ItMi_Gold, 10);
			
		}
		else if (Npc_HasItems (other, ItMi_Gold) < 100)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_05");//Tu hai più di 50 monete d'oro. Donane 25 a Innos per ricevere la sua benedizione.
			B_GiveInvItems (other, self, ItMi_Gold, 25);
		}
		else
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_06");//Tu hai più di 100 monete d'oro, il Signore dice, 'dona ciò che puoi'.
			AI_Output (self, other,"DIA_Daron_Spenden_10_07");//La chiesa accetta la tua generosa offerta.
			B_GiveInvItems (other, self, ItMi_Gold, 50);
			
		};
		
		AI_Output (self, other,"DIA_Daron_Spenden_10_08");//Ti benedico nel nome di Innos, perché egli è giusto e illuminato.
		Daron_Segen = TRUE;
		B_GivePlayerXP (XP_InnosSegen);
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron il Mago del Fuoco mi ha dato la sua benedizione.");
		};
	};
};

// ************************************************************
// 			  Wo kommst du her?
// ************************************************************
INSTANCE DIA_Daron_Woher(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Woher_Condition;
	information	= DIA_Daron_Woher_Info;
	permanent	= FALSE;
	description	= "Da dove venite?";
};                       
FUNC INT DIA_Daron_Woher_Condition()
{	
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Woher_Info()
{	
	AI_Output (other, self,"DIA_Daron_Woher_15_00");//Da dove vieni?
	AI_Output (self, other,"DIA_Daron_Woher_10_01");//Vengo dal monastero dei maghi che si trova sulle montagne.
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other,"DIA_Daron_Woher_10_02");//Qui accettiamo tutti i puri di cuore che vogliono servire il nostro onnipotente signore Innos.
	};
};

// ************************************************************
// 			Innos
// ************************************************************
INSTANCE DIA_Daron_Innos(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Innos_Condition;
	information	= DIA_Daron_Innos_Info;
	permanent	= FALSE;
	description	= "Parlami di Innos.";
};                       
FUNC INT DIA_Daron_Innos_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	&& (other.guild != GIL_KDF)
	&& (other.guild != GIL_DJG)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Innos_Info()
{	
	AI_Output (other, self,"DIA_Daron_Innos_15_00");//Dimmi di Innos.
	AI_Output (self, other,"DIA_Daron_Innos_10_01");//Innos, nostro onnipotente signore, rappresenta la luce e il fuoco.
	AI_Output (self, other,"DIA_Daron_Innos_10_02");//Egli sceglie gli esseri umani come suoi strumenti, donando loro la magia e le leggi.
	AI_Output (self, other,"DIA_Daron_Innos_10_03");//Noi agiamo in suo nome. Amministriamo la giustizia secondo la sua volontà e predichiamo la sua parola.
};

// ************************************************************
// 			  Kloster
// ************************************************************
INSTANCE DIA_Daron_Kloster(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Kloster_Condition;
	information	= DIA_Daron_Kloster_Info;
	permanent	= FALSE;
	description	= "Parlami ancora del monastero.";
};                       
FUNC INT DIA_Daron_Kloster_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	|| Npc_KnowsInfo (other, DIA_Daron_Paladine)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_KDF) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Kloster_Info()
{	
	AI_Output (other, self,"DIA_Daron_Kloster_15_00");//Parlami ancora del monastero.
	AI_Output (self, other,"DIA_Daron_Kloster_10_01");//Insegniamo ai nostri studenti tutte le forme di magia. Ma le arti dei maghi del fuoco vanno oltre queste.
	AI_Output (self, other,"DIA_Daron_Kloster_10_02");//Siamo anche esperti nell'arte dell'alchimia e nella creazione di potenti rune.
	AI_Output (self, other,"DIA_Daron_Kloster_10_03");//E produciamo anche un ottimo vino.
};

// ************************************************************
// 			 Stadt
// ************************************************************
INSTANCE DIA_Daron_Stadt(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 99;
	condition	= DIA_Daron_Stadt_Condition;
	information	= DIA_Daron_Stadt_Info;
	permanent	= FALSE;
	description	= "Come mai sei in città?";
};                       
FUNC INT DIA_Daron_Stadt_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Stadt_Info()
{	
	AI_Output (other, self,"DIA_Daron_Stadt_15_00");//Come mai sei in città?
	AI_Output (self, other,"DIA_Daron_Stadt_10_01");//Parlo con i paladini e aiuto i cittadini con i miei consigli e le mie parole di conforto.
	AI_Output (self, other,"DIA_Daron_Stadt_10_02");//È nostro compito metterci a disposizione della gente e aiutare i poveri, soprattutto in questi tempi difficili.
};

///////////////////////////////////////////////////////////////////////
//	Info GuildHelp
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_GuildHelp		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Daron_GuildHelp_Condition;
	information	 = 	DIA_Addon_Daron_GuildHelp_Info;

	description	 = 	"Ho sentito delle voci a proposito di una statuetta...";
};

func int DIA_Addon_Daron_GuildHelp_Condition ()
{
	if (MIS_Addon_Vatras_Go2Daron == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Daron_Stadt))
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_GuildHelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_00"); //Ho saputo di una certa statuetta che avresti perso...
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_01"); //Ah sì? Può avertelo detto soltanto Vatras, il Mago dell'Acqua.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_02"); //Qual è il problema?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_03"); //Una statuetta di valore inestimabile è stata inviata al monastero dalla terraferma. Ma non è mai arrivata al monastero.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_04"); //La nave è stata razziata?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_05"); //(vergognoso) No. È attraccata a Khorinis sana e salva, e io le sono andato incontro.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_06"); //Ma mentre tornavo al monastero, una banda di goblin me l'ha rubata.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_07"); //(arrabbiato) Non guardarmi così! Anche noi maghi siamo soltanto umani, sai.
	
	MIS_Addon_Vatras_Go2Daron = LOG_SUCCESS;
	MIS_Addon_Daron_GetStatue = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Dicevi che ora ce l'hanno i goblin?", DIA_Addon_Daron_GuildHelp_gobbos );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Dov'eri quando hai perso la statuetta?", DIA_Addon_Daron_GuildHelp_wo );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Non hai provato a riprenderti la statuetta?", DIA_Addon_Daron_GuildHelp_wiederholen );
};

func void DIA_Addon_Daron_GuildHelp_wiederholen ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wiederholen_15_00"); //Non hai provato a riprenderti la statuetta?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wiederholen_10_01"); //Certo! L'ho cercata in lungo e in largo, ma è stato tutto inutile.
};

func void DIA_Addon_Daron_GuildHelp_gobbos ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_gobbos_15_00"); //Dicevi che ora ce l'hanno i goblin?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_01"); //Me l'hanno rubata e sono scappati nel sottobosco.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_02"); //Non li ho più rivisti. Si saranno rintanati in qualche buca nel terreno.
};

func void DIA_Addon_Daron_GuildHelp_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wo_15_00"); //Dov'eri quando hai perso la statuetta?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wo_10_01"); //Stavo andando al monastero. Ero vicino alla taverna di Orlan.

	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Ho sentito abbastanza. Te la ritroverò.", DIA_Addon_Daron_GuildHelp_auftrag );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "La taverna di Orlan? E dov'è?", DIA_Addon_Daron_GuildHelp_woTaverne );
};

func void DIA_Addon_Daron_GuildHelp_woTaverne ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_woTaverne_15_00"); //La taverna di Orlan? E dov'è?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_01"); //Esci dalla città da questa porta e segui il sentiero, troverai una casa isolata.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_02"); //Quella è la taverna di Orlan, L''Arpia Morta'.
};

func void DIA_Addon_Daron_GuildHelp_auftrag ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_auftrag_15_00"); //Ho sentito abbastanza. Te la ritroverò.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_auftrag_10_01"); //Che Innos ti guidi e ti protegga dai pericoli che ti attendono fuori dalle porte della città.
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Daron è stato derubato da alcuni goblin impertinenti. Da allora non riesce più a trovare una preziosa statuetta che avrebbe dovuto portare al monastero. Si dice che i goblin siano nascosti in un buco vicino alla taverna dell''Arpia Morta'."); 
};

///////////////////////////////////////////////////////////////////////
//	Info FoundStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_FoundStatue		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Daron_FoundStatue_Condition;
	information	 = 	DIA_Addon_Daron_FoundStatue_Info;

	description	 = 	"Ho trovato la statuetta.";
};

func int DIA_Addon_Daron_FoundStatue_Condition ()
{
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (DIA_Gorax_GOLD_perm == FALSE) 
	&& (MIS_Addon_Daron_GetStatue == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_FoundStatue_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_00"); //Ho trovato la statuetta.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_01"); //Sia ringraziato Innos!
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_02"); //Cosa ne farai ora?
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_03"); //Assolutamente niente. Mi ha portato soltanto sfortuna.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_04"); //Sarai TU a riportarla al monastero, figliolo.
	if (other.guild == GIL_NONE)
	{
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_05"); //Naturalmente, non ti faranno entrare se non giurerai di consacrare la tua vita al servizio del monastero.
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_06"); //Ma sono certo che non ti dispiacerà farlo per rendere un favore a ME, giusto?
	};
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_07"); //Vai con Innos, figliolo!
};

///////////////////////////////////////////////////////////////////////
//	Info ReturnedStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_ReturnedStatue		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Daron_ReturnedStatue_Condition;
	information	 = 	DIA_Addon_Daron_ReturnedStatue_Info;

	description	 = 	"Ho portato la tua statuetta al monastero.";
};

func int DIA_Addon_Daron_ReturnedStatue_Condition ()
{
	if (DIA_Gorax_GOLD_perm == TRUE) 
	&& (MIS_Addon_Daron_GetStatue == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_ReturnedStatue_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_ReturnedStatue_15_00"); //Ho portato la tua statuetta al monastero. Ora puoi rilassarti.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_01"); //Ottima notizia. Che Innos ti protegga.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_02"); //Accetta questo come segno della mia gratitudine.
	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);
	TOPIC_End_RangerHelpKDF = TRUE;		
	B_GivePlayerXP (XP_Addon_ReportLostInnosStatue2Daron);
};

// ************************************************************
// 			arm
// ************************************************************
INSTANCE DIA_Daron_arm(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 10;
	condition	= DIA_Daron_arm_Condition;
	information	= DIA_Daron_arm_Info;
	permanent	= FALSE;
	description	= "Sono povero!";
};                       
FUNC INT DIA_Daron_arm_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Stadt)
	&& (Npc_HasItems  (other, ItMi_Gold) < 10) 
	&& (other.guild == GIL_NONE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_arm_Info()
{	
	AI_Output (other, self,"DIA_Daron_arm_15_00");//Sono povero!
	AI_Output (self, other,"DIA_Daron_arm_10_01");//Dunque, ti sei impoverito. Non c'è da stupirsi di questi tempi. Prendi quest'oro, dovrebbe tornarti utile.
	AI_Output (self, other,"DIA_Daron_arm_10_02");//Dovresti trovarti un lavoro per rimettere in sesto le tue finanze e potresti donare una parte dell'oro alla chiesa di Innos, come questa ha fatto con te.
	
	B_GiveInvItems (self, other, ItMi_Gold, 20);
};

// ************************************************************
// 			 Immer wieder spenden 
// ************************************************************
INSTANCE DIA_Daron_Spende(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 990;
	condition	= DIA_Daron_Spende_Condition;
	information	= DIA_Daron_Spende_Info;
	permanent	= TRUE;
	description	= "Voglio fare una donazione...";
};      
//-------------------------------------
var int DIA_Daron_Spende_permanent;
//-------------------------------------                 
FUNC INT DIA_Daron_Spende_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (DIA_Daron_Spende_permanent == FALSE)
	&& Npc_KnowsInfo (other,DIA_Daron_Spenden)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Spende_Info()
{	
	
	AI_Output (other, self,"DIA_Daron_Spende_15_00");//Voglio fare una donazione...
	
	Info_ClearChoices (DIA_Daron_Spende);
	
	if (Daron_Spende < 1000)
	{
		Info_AddChoice 	(DIA_Daron_Spende,"Ma non ho abbastanza monete d’oro con me... (INDIETRO)",DIA_Daron_Spende_BACK);
		
		Info_AddChoice 	(DIA_Daron_Spende,"(50 monete d’oro)",DIA_Daron_Spende_50);
		Info_AddChoice 	(DIA_Daron_Spende,"(100 monete d’oro)",DIA_Daron_Spende_100);
		Info_AddChoice 	(DIA_Daron_Spende,"(200 monete d’oro)",DIA_Daron_Spende_200);
	 }
	 else 
	 {
	 	AI_Output (self, other,"DIA_Daron_Spende_10_01");//In tutto mi hai donato oltre 1000 monete d'oro.
	 	AI_Output (self, other,"DIA_Daron_Spende_10_02");//La benedizione di Innos è sempre con te.
	 	
	 	DIA_Daron_Spende_permanent = TRUE;	
		B_DaronSegen ();
	 };
};
FUNC VOID DIA_Daron_Spende_BACK()
{
	AI_Output (other, self,"DIA_Daron_Spende_BACK_15_00"); //Ma io non ho portato molto oro...
	AI_Output (self, other,"DIA_Daron_Spende_BACK_10_01"); //Non importa figliolo. Puoi donare quello che vorrai anche più tardi.
	
	Info_ClearChoices (DIA_Daron_Spende);
};	
//----------------------------
var int Daron_Spende;
//----------------------------
FUNC VOID DIA_Daron_Spende_50()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 50)
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_00");//Ti benedico nel nome di Innos, perché egli è giusto e illuminato.
		Daron_Spende = (Daron_Spende + 50);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron il Mago del Fuoco mi ha dato la sua benedizione.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_01");//Puoi fare un'offerta in qualsiasi momento, quando avrai con te più oro.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_100()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_00");//Innos, tu sei la luce che illumina la strada del bene.
		AI_Output (self, other,"DIA_Daron_Spende_100_10_01");//Nel tuo nome, io benedico quest'uomo. Possa la tua luce brillare su di lui.
		Daron_Spende = (Daron_Spende + 100);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron il Mago del Fuoco mi ha dato la sua benedizione.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_02");//Il Signore dice 'se vuoi pregare, apri il tuo spirito'. E se vuoi fare un'offerta, porta il tuo dono.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_200()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 200)
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_00");//Innos, benedici quest'uomo e lascia che la tua luce brilli su di lui.
		AI_Output (self, other,"DIA_Daron_Spende_200_10_01");//Dagli la forza per comportarsi in maniera onesta.
		Daron_Spende = (Daron_Spende + 200);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron il Mago del Fuoco mi ha dato la sua benedizione.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_02");//Se vuoi donare tutto quell'oro, allora faresti meglio a procurartelo prima.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};


	
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Daron_PICKPOCKET (C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 900;
	condition	= DIA_Daron_PICKPOCKET_Condition;
	information	= DIA_Daron_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Daron_PICKPOCKET_Condition()
{
	C_Beklauen (47, 80);
};
 
FUNC VOID DIA_Daron_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Daron_PICKPOCKET);
	Info_AddChoice		(DIA_Daron_PICKPOCKET, DIALOG_BACK 		,DIA_Daron_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Daron_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Daron_PICKPOCKET_DoIt);
};

func void DIA_Daron_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Daron_PICKPOCKET);
};
	
func void DIA_Daron_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Daron_PICKPOCKET);
};










