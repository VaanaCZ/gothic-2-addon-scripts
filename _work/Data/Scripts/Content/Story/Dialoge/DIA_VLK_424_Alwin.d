// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Alwin_EXIT(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 999;
	condition	= DIA_Alwin_EXIT_Condition;
	information	= DIA_Alwin_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Alwin_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Alwin_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Alwin_PICKPOCKET (C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 900;
	condition	= DIA_Alwin_PICKPOCKET_Condition;
	information	= DIA_Alwin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Alwin_PICKPOCKET_Condition()
{
	C_Beklauen (20, 10);
};
 
FUNC VOID DIA_Alwin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Alwin_PICKPOCKET);
	Info_AddChoice		(DIA_Alwin_PICKPOCKET, DIALOG_BACK 		,DIA_Alwin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Alwin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Alwin_PICKPOCKET_DoIt);
};

func void DIA_Alwin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Alwin_PICKPOCKET);
};
	
func void DIA_Alwin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Alwin_PICKPOCKET);
};
//***************************************************
//		Schafe
//***************************************************
INSTANCE DIA_Alwin_Sheep(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 3;
	condition	= DIA_Alwin_Sheep_Condition;
	information	= DIA_Alwin_Sheep_Info;
	permanent	= FALSE;
	description = "Est-ce que ce sont vos moutons ?";
};                       
FUNC INT DIA_Alwin_Sheep_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Alwin_Sheep_Info()
{	
	AI_Output (other, self,"DIA_Alwin_Sheep_15_00"); //Ces moutons sont à vous ?
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_01"); //En fait, sur le lot, il n'y a qu'une brebis à moi. Je l'ai baptisée Lucy. (éclate de rire) C'est le prénom de ma femme !
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_02"); //Les moutons appartiennent à la milice. Ses membres m'apportent tous les animaux qu'ils prennent aux fermiers.
};
//***************************************************
//		Der irre Fellan
//***************************************************
INSTANCE DIA_Alwin_Fellan(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 2;
	condition	= DIA_Alwin_Fellan_Condition;
	information	= DIA_Alwin_Fellan_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Alwin_Fellan_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_Fellan_Info()
{	
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_00"); //Seigneur, ce dingue me rendra fou !
	AI_Output (other, self,"DIA_Alwin_Fellan_15_01"); //De qui parlez-vous ?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_02"); //Vous n'entendez pas ces coups de marteau incessant ? Qui fait ce vacarme toute la journée à votre avis ?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_03"); //Ce fou furieux de Fellan, voilà de qui je veux parler. Il passe ses journées à construire sa hutte à coups de marteau.
};
//***************************************************
//		Der irre Fellan
//***************************************************
INSTANCE DIA_Alwin_FellanRunning (C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 2;
	condition	= DIA_Alwin_FellanRunning_Condition;
	information	= DIA_Alwin_FellanRunning_Info;
	permanent	= FALSE;
	description = "Je pourrais m'occuper de Fellan...";
};                       
FUNC INT DIA_Alwin_FellanRunning_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_FellanRunning_Info()
{	
	AI_Output (other, self,"DIA_Alwin_FellanRunning_15_00"); //Je pourrais m'occuper de lui...
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_01"); //Vous seriez d'accord pour m'aider ? Mais qu'est-ce que vous y gagneriez ?
	AI_Output (other, self,"DIA_Alwin_FellanRunning_15_02"); //A vous de me le dire...
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_03"); //Ah, je vois ! Bon, très bien. Je vous offre 25 pièces d'or si vous parvenez à le convaincre de cesser de faire du bruit.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_04"); //Mais je vous préviens tout de suite, il est impossible de lui parler. Il est complètement dingue ! Je ne vois que quelques coups de poing bien sentis pour lui faire entendre raison.
	
	MIS_AttackFellan = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Alwin,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Alwin,LOG_RUNNING);
	B_LogEntry (TOPIC_Alwin,"Alwin veut que je convaincs Fellan d'arrêter de marteler. Le tuer n'est pas une solution.");
		
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
	Info_AddChoice (DIA_Alwin_FellanRunning, "Je verrai ce que je peux faire...", DIA_Alwin_FellanRunning_Ok);
	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	{
		Info_AddChoice (DIA_Alwin_FellanRunning, "Si je le tabasse je vais m'attirer des ennuis avec la milice...", DIA_Alwin_FellanRunning_Problems);
	};
};

func void DIA_Alwin_FellanRunning_Ok()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Ok_15_00"); //Je vais voir ce que je peux faire.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_Ok_12_01"); //Pensez-y. Et n'oubliez pas, il y a 25 pièces d'or pour vous.
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
};

func void DIA_Alwin_FellanRunning_Problems()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Problems_15_00"); //Si je le tabasse, la milice me fera des ennuis...
	AI_Output (self ,other,"DIA_Alwin_Add_12_00"); //Personne ne fait guère attention aux rixes dans le quartier du port.
	AI_Output (self ,other,"DIA_Alwin_Add_12_01"); //Par contre, s'il vous prenait l'envie de voler quelqu'un ou de toucher aux moutons, là, vous auriez des ennuis.

	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_01"); //Der irre Fellan wird nicht zur Miliz rennen und dich anzeigen. Du könntest höchstens ein Problem bekommen, wenn seine Nachbarn was davon mitbekommen.
	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_02"); //Schlägereien sind hier nicht gerne gesehen, und je mehr Zeugen es gibt, desto schlimmer wird die Sache.
	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_03"); //Aber wenn du ihn dazu bringst, dass ER dich angreift, werden alle Leute, die den Kampf mitkriegen, auf deiner Seite sein.
};

//***************************************************
//		Fellan auf's Maul gehauen 
//***************************************************
INSTANCE DIA_Alwin_FellanSuccess(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 4;
	condition	= DIA_Alwin_FellanSuccess_Condition;
	information	= DIA_Alwin_FellanSuccess_Info;
	permanent	= FALSE;
	description	= "Fellan ne fera plus de bruit avec son marteau.";
};                       
FUNC INT DIA_Alwin_FellanSuccess_Condition()
{	
	if (MIS_AttackFellan == LOG_RUNNING)
	&& ((FellanGeschlagen == TRUE)
	|| Npc_IsDead (Fellan))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_FellanSuccess_Info()
{	
	AI_Output (other, self,"DIA_Alwin_FellanSuccess_15_00"); //Vous n'entendrez plus les coups de marteau de Fellan.
	AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_01"); //C'est vrai ? Plus de coups de marteau ? Enfin ! Et moi qui commençais à me dire qu'il ne s'arrêterait jamais.
	
	if (Npc_IsDead (Fellan) == FALSE) 
	{
		AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_02"); //Vous m'avez rendu un précieux service. Vous savez quoi ? Je crois bien que je vais vous donner 30 pièces d'or finalement.
		
		B_GiveInvItems (self, other, ItMi_Gold, 30);
		
		MIS_AttackFellan = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient); 
	}
	else 
	{
		MIS_AttackFellan = LOG_FAILED;
	};
};
//***************************************************
//		Perm Info
//***************************************************
INSTANCE DIA_Alwin_Endlos(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 8;
	condition	= DIA_Alwin_Endlos_Condition;
	information	= DIA_Alwin_Endlos_Info;
	permanent	= TRUE;
	description	= "Et comment vont les moutons ?";
};                       
FUNC INT DIA_Alwin_Endlos_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Alwin_Sheep)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_Endlos_Info()
{	
	AI_Output (other, self,"DIA_Alwin_Endlos_15_00"); //Comment vont vos moutons ?
	
	if (MIS_AttackFellan != LOG_SUCCESS)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_01"); //Les coups de marteau de Fellan vont finir par les rendre dingues. Un de ces jours, ils perdront complètement la boule.
		
	}
	else if (Kapitel <= 2)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_02"); //Ils ne font que manger et s'engraisser... comme ma femme quoi ! Ha, ha, ha !
	}
	else if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_03"); //Il va probablement falloir que j'en tue un, pour le dernier repas.
			AI_Output (other, self,"DIA_Alwin_Endlos_15_04"); //Le dernier quoi ?
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_05"); //Repas. Pour le mercenaire qui a assassiné un paladin. Car il va être exécuté, c'est sûr.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_06"); //Il me reste juste à décider lequel je vais tuer.
		}
		else
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_07"); //Lucy a beaucoup de chance d'être encore en vie.
			AI_Output (other, self,"DIA_Alwin_Endlos_15_08"); //Je croyais que Lucy était votre femme.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_09"); //Oui, mais vous vous souvenez que je vous avais dit que j'avais donné ce nom à une brebis ? Eh bien, c'est elle qui aurait fini dans l'assiette de Bennet.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_10"); //Mais toute cette histoire s'est bien terminée. C'est Lucy qui va être contente !
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_11"); //Plus le temps passe et plus je m'ennuie à regarder les moutons manger.
	}
	else	//Kapitel 5
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_12"); //Cette fois, je vais leur dire au revoir. Le seigneur Hagen a ordonné que tous les moutons servent de provisions pour ses soldats.
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_13"); //Au moins, j'aurai davantage de temps pour ma femme.
	};
};



