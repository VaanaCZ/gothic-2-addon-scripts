
//***********************************************************************
//	Info EXIT 
//***********************************************************************

INSTANCE DIA_Agon_EXIT   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 999;
	condition   = DIA_Agon_EXIT_Condition;
	information = DIA_Agon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Agon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Agon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//************************************************************************
//			Hello
//************************************************************************

INSTANCE DIA_Agon_Hello   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 2;
	condition   = DIA_Agon_Hello_Condition;
	information = DIA_Agon_Hello_Info;
	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_Agon_Hello_Condition()
{
	if  (Npc_IsInState (self,ZS_Talk))
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&  (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_Hello_Info()
{
	AI_Output (self ,other,"DIA_Agon_Hello_07_00"); //(sprezzante) Cosa vuoi?
};

// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Agon_Wurst(C_INFO)
{
	npc         = NOV_603_Agon;
	nr			= 2;
	condition	= DIA_Agon_Wurst_Condition;
	information	= DIA_Agon_Wurst_Info;
	permanent	= FALSE;
	description = "Ecco. Questa salsiccia di pecora è per te.";
};                       

FUNC INT DIA_Agon_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Agon_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Agon_Wurst_15_00"); //Ecco. Questa salsiccia di pecora è per te.
	AI_Output (self, other, "DIA_Agon_Wurst_07_01"); //Salsiccia di pecora, formaggio di pecora... latte di pecora... sto arrivando al punto di non poterle nemmeno vedere.
	AI_Output (other, self, "DIA_Agon_Wurst_15_02"); //Allora, vuoi la salsiccia o no?
	AI_Output (self, other, "DIA_Agon_Wurst_07_03"); //D'accordo, la voglio!
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
//***********************************************************************
//	Ich bin Neu hier.
//***********************************************************************

INSTANCE DIA_Agon_New   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_New_Condition;
	information = DIA_Agon_New_Info;
	permanent   = FALSE;
	description = "Sono nuovo.";
};

FUNC INT DIA_Agon_New_Condition()
{
	if (MIS_SCHNITZELJAGD == FALSE)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_New_Info()
{
	AI_Output	(other,self ,"DIA_Agon_New_15_00"); //Sono nuovo.
	AI_Output	(self ,other,"DIA_Agon_New_07_01"); //Vedo.
	AI_Output	(self ,other,"DIA_Agon_New_07_02"); //Se non hai nessun lavoro da fare, chiedi a Parlan. Avrà sicuramente qualcosa per te.
};
//***********************************************************************
//	Was ist zwischen dir und Babo passiert?
//***********************************************************************

INSTANCE DIA_Agon_YouAndBabo   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_YouAndBabo_Condition;
	information = DIA_Agon_YouAndBabo_Info;
	permanent   = FALSE;
	description = "Cosa è successo tra te e Balbo?";
};

FUNC INT DIA_Agon_YouAndBabo_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Opolos_Monastery)
	&& (MIS_SCHNITZELJAGD == FALSE))
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_YouAndBabo_Info()
{
	AI_Output	(other,self ,"DIA_Agon_YouAndBabo_15_00"); //Cosa è successo tra te e Balbo?
	AI_Output	(self ,other,"DIA_Agon_YouAndBabo_07_01"); //Non dovresti credere a tutto quello che senti in giro.
	AI_Output	(self ,other,"DIA_Agon_YouAndBabo_07_02"); //(insistentemente) Parliamoci chiaro: io andrò per la mia strada. La strada che Innos mi ha destinato.
	AI_Output	(self ,other,"DIA_Agon_YouAndBabo_07_03"); //Non permetterò a nessuno di ostacolarmi, e sicuramente non a quel sempliciotto di Babo.

	Info_ClearChoices 	(DIA_Agon_YouAndBabo);
	Info_AddChoice	(DIA_Agon_YouAndBabo,"I novizi non dovrebbero rimanere uniti?",DIA_Agon_YouAndBabo_AllTogether);
	Info_AddChoice	(DIA_Agon_YouAndBabo,"Solo Innos sa quale percorso dovremmo prendere.",DIA_Agon_YouAndBabo_InnosWay);
	Info_AddChoice	(DIA_Agon_YouAndBabo,"Andremo perfettamente d’accordo.",DIA_Agon_YouAndBabo_Understand);
};

FUNC VOID DIA_Agon_YouAndBabo_AllTogether ()
{
	AI_Output (other,self ,"DIA_Agon_YouAndBabo_AllTogether_15_00"); //I novizi non dovrebbero rimanere uniti?
	AI_Output (self ,other,"DIA_Agon_YouAndBabo_AllTogether_07_01"); //Voialtri potete fare quello che vi pare.
	AI_Output (self ,other,"DIA_Agon_YouAndBabo_AllTogether_07_02"); //Basta che non mi facciate perdere tempo. (freddamente) E che nessuno cerchi di ostacolarmi.
	
	Info_ClearChoices 	(DIA_Agon_YouAndBabo);
};

FUNC VOID DIA_Agon_YouAndBabo_InnosWay ()
{
	AI_Output	(other,self ,"DIA_Agon_YouAndBabo_InnosWay_15_00"); //Solo Innos sa quale percorso dovremmo prendere.
	AI_Output 	(self ,other,"DIA_Agon_YouAndBabo_InnosWay_07_01"); //La mia famiglia è sempre stata una delle più vicine a Innos e così sarà sempre.
	
	Info_ClearChoices 	(DIA_Agon_YouAndBabo);
};
FUNC VOID DIA_Agon_YouAndBabo_Understand ()
{
	AI_Output	(other,self ,"DIA_Agon_YouAndBabo_Understand_15_00"); //Andremo perfettamente d’accordo.
	AI_Output 	(self ,other,"DIA_Agon_YouAndBabo_Understand_07_01"); //Lo spero. Una volta che sarò diventato mago, metterò una buona parola per te.
	
	Info_ClearChoices 	(DIA_Agon_YouAndBabo);
};
//************************************************************************
//	Kann ich bei dir Kräuter bekommen?
//************************************************************************

INSTANCE DIA_Agon_GetHerb   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_GetHerb_Condition;
	information = DIA_Agon_GetHerb_Info;
	permanent   = TRUE;
	description = "Cosa stai piantando, qui?";
};

FUNC INT DIA_Agon_GetHerb_Condition()
{
	if (MIS_SCHNITZELJAGD == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Agon_GetHerb_Info()
{
	AI_Output (other,self ,"DIA_Agon_GetHerb_15_00"); //Cosa stai piantando, qui?
	AI_Output (self ,other,"DIA_Agon_GetHerb_07_01"); //Stiamo cercando di coltivare delle piante curative che maestro Neoras possa utilizzare per distillare le proprie pozioni.
};
//************************************************************************
//	Agon ist in der Höhle
//************************************************************************

INSTANCE DIA_Agon_GolemDead   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_GolemDead_Condition;
	information = DIA_Agon_GolemDead_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Agon_GolemDead_Condition()
{
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (Npc_IsDead (Magic_Golem))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_GolemDead_Info()
{
	AI_Output (self ,other,"DIA_Agon_GolemDead_07_00"); //(trionfante) Sei in ritardo!
	AI_Output (self ,other,"DIA_Agon_GolemDead_07_01"); //Sono arrivato per primo! Ho vinto!
	 
	Info_ClearChoices (DIA_Agon_GolemDead);
	Info_AddChoice (DIA_Agon_GolemDead,"(minacciando) Solo se esci di qui vivo.",DIA_Agon_GolemDead_NoWay);
	Info_AddChoice (DIA_Agon_GolemDead,"Zitto!",DIA_Agon_GolemDead_ShutUp);
	Info_AddChoice (DIA_Agon_GolemDead,"Congratulazioni! Tre lo sei davvero meritato!",DIA_Agon_GolemDead_Congrat);
};

FUNC VOID DIA_Agon_GolemDead_NoWay ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_NoWay_15_00"); //(minacciando) Solo se esci di qui vivo.
	AI_Output (self ,other,"DIA_Agon_GolemDead_NoWay_07_01"); //Vuoi uccidermi? Non ci riuscirai.

	AI_StopProcessInfos (self);	
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Agon_GolemDead_ShutUp ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_ShutUp_15_00"); //Zitto!
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_07_01"); //(beffardo) È inutile, hai perso! Rassegnati.
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_07_02"); //Solamente io sono destinato a diventare un mago.
	
	Info_ClearChoices (DIA_Agon_GolemDead);
	Info_AddChoice (DIA_Agon_GolemDead,"Destinato un accidente. Il forziere è mio.",DIA_Agon_GolemDead_ShutUp_MyChest);
	Info_AddChoice (DIA_Agon_GolemDead,"Hai vinto.",DIA_Agon_GolemDead_ShutUp_YouWin);

};

FUNC VOID DIA_Agon_GolemDead_ShutUp_MyChest ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_ShutUp_MyChest_15_00"); //Destinato un accidente. Il forziere è mio.
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_MyChest_07_01"); //(furioso) No, non puoi farlo, ti ucciderò prima.
	
	AI_StopProcessInfos (self);	
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Agon_GolemDead_ShutUp_YouWin ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_ShutUp_YouWin_15_00"); //Hai vinto.
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_01"); //(furioso) No, non m'inganni. Stai cercando di liberarti di me.
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_02"); //Lo impedirò a tutti i costi!
	
	AI_StopProcessInfos (self);	
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Agon_GolemDead_Congrat ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_Congrat_15_00"); //Congratulazioni! Te lo sei davvero meritato!
	AI_Output (self ,other,"DIA_Agon_GolemDead_Congrat_07_01"); //(diffidente) Che cosa significa? Cosa stai architettando?
	AI_Output (other,self ,"DIA_Agon_GolemDead_Congrat_15_02"); //Ma di che parli?
	AI_Output (self ,other,"DIA_Agon_GolemDead_Congrat_07_03"); //(nervoso) Tu vuoi negare la mia vittoria. Vuoi uccidermi e prenderti tutto il merito!
	AI_Output (self ,other,"DIA_Agon_GolemDead_Congrat_07_04"); //Non ci riuscirai mai!
	
	AI_StopProcessInfos (self);	
	B_Attack (self,other,AR_NONE, 1);
};

//****************************************
//	Der Sc war vor Agon in der Höhle
//****************************************

INSTANCE DIA_Agon_GolemLives   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_GolemLives_Condition;
	information = DIA_Agon_GolemLives_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Agon_GolemLives_Condition()
{
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (Npc_IsDead (Magic_Golem)== FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_GolemLives_Info()
{
	AI_Output (self ,other,"DIA_Agon_GolemLives_07_00"); //(sorpreso) Hai trovato il nascondiglio prima di me. Non può essere...
	AI_Output (self ,other,"DIA_Agon_GolemLives_07_01"); //(determinato) Non può essere! Non lo permetterò.
	AI_Output (self ,other,"DIA_Agon_GolemLives_07_02"); //Non troveranno neanche il tuo cadavere.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 0);
};

//****************************************
//	Sc hat Agon am Leben gelassen
//****************************************
/*
INSTANCE DIA_Agon_StillAlive   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_StillAlive_Condition;
	information = DIA_Agon_StillAlive_Info;
	permanent   = TRUE;
	description = "Was machst Du hier?";
};

FUNC INT DIA_Agon_StillAlive_Condition()
{
	if ((Kapitel >= 2)
	&& 	(hero.guild == GIL_KDF))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_StillAlive_Info()
{
	AI_Output (other,self ,"DIA_Agon_StillAlive_15_00"); //Was machst Du hier? 
	AI_Output (self ,other,"DIA_Agon_StillAlive_07_01"); //Hättest Du mich nicht töten können? Dann müsste ich das ganze hier wenigstens nicht mehr ertragen. 
	AI_Output (self ,other,"DIA_Agon_StillAlive_07_02"); //Jetzt lass mich in Ruhe! Geh zurück ins Kloster!
	
	AI_StopProcessInfos (self);
};
*/
//***********************************************************************
// Perm
//***********************************************************************

INSTANCE DIA_Agon_Perm   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 2;
	condition   = DIA_Agon_Perm_Condition;
	information = DIA_Agon_Perm_Info;
	permanent   = TRUE;
	description = "Allora, come vanno le cose?";
};

FUNC INT DIA_Agon_Perm_Condition()
{
	if (Kapitel >= 3)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Agon_Perm_Info()
{
	AI_Output	(other,self ,"DIA_Agon_Perm_15_00"); //Allora, come va?
	
	if (other.guild == GIL_PAL)
	{
		AI_Output	(self ,other,"DIA_Agon_Perm_07_01"); //Oh, grazie per il tuo interessamento, Signor Paladino. Mi piace il lavoro qui e sono sicuro che sarò scelto come mago molto presto.
	}
	else
	{
		AI_Output	(self ,other,"DIA_Agon_Perm_07_02"); //(arrogante) Sei solamente un ospite qui nel monastero di Innos. Pertanto comportati come tale e non disturbarmi mentre sto lavorando. Buona giornata.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Agon_PICKPOCKET (C_INFO)
{
	npc			= NOV_603_Agon;
	nr			= 900;
	condition	= DIA_Agon_PICKPOCKET_Condition;
	information	= DIA_Agon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Agon_PICKPOCKET_Condition()
{
	C_Beklauen (23, 12);
};
 
FUNC VOID DIA_Agon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Agon_PICKPOCKET);
	Info_AddChoice		(DIA_Agon_PICKPOCKET, DIALOG_BACK 		,DIA_Agon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Agon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Agon_PICKPOCKET_DoIt);
};

func void DIA_Agon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Agon_PICKPOCKET);
};
	
func void DIA_Agon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Agon_PICKPOCKET);
};


