///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hakon_EXIT   (C_INFO)
{
	npc         = VLK_407_Hakon;
	nr          = 999;
	condition   = DIA_Hakon_EXIT_Condition;
	information = DIA_Hakon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Hakon_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Hakon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Sperre		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_Sperre_Condition;
	information	 = 	DIA_Hakon_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Hakon_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self, ZS_Talk ))
	{
		return TRUE;
	};
	//return FALSE;
};
func void DIA_Hakon_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Hakon_Sperre_12_00"); //Allez-vous en, sale prisonnier ! Canthar m'a dit quel pourri vous �tiez !
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Hallo		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 =  3;
	condition	 = 	DIA_Hakon_Hallo_Condition;
	information	 = 	DIA_Hakon_Hallo_Info;
	important	 = 	TRUE;
	permanent	 =  FALSE;
};
func int DIA_Hakon_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk) 
	&& (Canthar_Sperre == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Hallo_Info ()
{
	AI_Output (self ,other,"DIA_Hakon_Add_12_00"); //Je suis Hakon, le vendeur d'armes.
	AI_Output (self ,other,"DIA_Hakon_Add_12_01"); //Ces temps-ci tout le monde devrait �tre arm�. Surtout quand on sort de la ville.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Hakon vend des armes sur la place du march�.");
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Trade		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	99;
	condition	 = 	DIA_Hakon_Trade_Condition;
	information	 = 	DIA_Hakon_Trade_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Montrez-moi vos marchandises.";
};
func int DIA_Hakon_Trade_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Hakon_Trade_15_00"); //Montrez-moi vos marchandises.
	
	if (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF)
	{
		AI_Output (self,other,"DIA_Hakon_Trade_12_01"); //C'est un honneur pour moi qu'un repr�sentant de notre sainte Eglise s'int�resse � ma marchandise.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Hakon_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_407_Hakon;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Hakon_MissingPeople_Condition;
	information	 = 	DIA_Addon_Hakon_MissingPeople_Info;

	description	 = 	"Que savez-vous sur les disparitions des citoyens de Khorinis ?";
};

func int DIA_Addon_Hakon_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Hakon_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Hakon_MissingPeople_15_00"); //Que savez-vous sur les disparitions des citoyens de Khorinis ?
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_01"); //J'en ai vu beaucoup franchir la porte est de la ville.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_02"); //Je n'avais jamais vu de ma vie certains de ceux qui sont venus et beaucoup de ceux qui sont partis ne sont jamais revenus.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_03"); //Mais ce qui est arriv� l'autre jour �tait vraiment tr�s �trange.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_04"); //Un homme, du nom de Joe, je crois, est venu. Il se vantait d'avoir bient�t une grosse somme d'argent.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_05"); //Il disait savoir comment rentrer dans l'une des tours de la ville, l� o� la milice entrepose ses armes.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_06"); //Je ne l'ai pas revu depuis, et pourtant je le croisais � la m�me heure chaque jour.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_07"); //J'en ai r�f�r� � la milice et peut-�tre l'ont-ils d�j� pinc� et que je le retrouverai au cachot.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_08"); //Mais le seigneur Andr� ne comprenait rien de ce que je racontais. Il ne connaissait m�me pas le gars en question.

	Log_CreateTopic (TOPIC_Addon_Joe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Joe, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Joe,"Halon, un marchand de Khorinis, dit qu'un d�nomm� Joe a simplement disparu sans laisser de traces. Il pr�tend que Joe sait comment se rendre dans l'une des tours de la ville, dans laquelle la milice entrepose ses armes."); 

	B_GivePlayerXP (XP_Ambient);
};

// ********************************************************
// 						OutOfTown
// ********************************************************
instance DIA_Hakon_OutOfTown		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_OutOfTown_Condition;
	information	 = 	DIA_Hakon_OutOfTown_Info;
	permanent	 = 	FALSE;
	description	 = 	"Dites-m'en plus sur les terres autour de la ville.";
};
func int DIA_Hakon_OutOfTown_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_OutOfTown_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_02"); //Parlez-moi des environs de la ville.
	AI_Output (self ,other,"DIA_Hakon_Add_12_03"); //Ils sont devenus extr�mement dangereux ces temps-ci.
	AI_Output (self ,other,"DIA_Hakon_Add_12_04"); //A cause des brigands, bien s�r, mais aussi des b�tes sauvages.
	AI_Output (self ,other,"DIA_Hakon_Add_12_05"); //Apparemment, m�me les animaux n'ont pas assez � manger en ce moment.
	AI_Output (self ,other,"DIA_Hakon_Add_12_06"); //Ils se rapprochent sans cesse un peu plus de la ville.
};

// ********************************************************
// 						Paladine
// ********************************************************
instance DIA_Hakon_Paladine		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	3;
	condition	 = 	DIA_Hakon_Paladine_Condition;
	information	 = 	DIA_Hakon_Paladine_Info;
	permanent	 = 	FALSE;
	description	 = 	"Savez-vous quoi que ce soit au sujet des paladins ?";
};
func int DIA_Hakon_Paladine_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_Paladine_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_07"); //Que savez-vous au sujet des paladins�?
	AI_Output (self ,other,"DIA_Hakon_Add_12_08"); //Ces types sont en train de me ruiner�!
	AI_Output (self ,other,"DIA_Hakon_Add_12_09"); //On ne peut quasiment rien acheter de plus grand qu'une �p�e courte en ville.
	AI_Output (self ,other,"DIA_Hakon_Add_12_10"); //Les paladins ont r�quisitionn� tout ce qui avait une plus longue lame.
	AI_Output (self ,other,"DIA_Hakon_Add_12_11"); //(sarcastique) En �change, j'ai le droit de vivre � l'h�tel sans payer ma chambre. Ha�!
};

// ********************************************************
// 						WoWaffen
// ********************************************************
instance DIA_Hakon_WoWaffen		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	4;
	condition	 = 	DIA_Hakon_WoWaffen_Condition;
	information	 = 	DIA_Hakon_WoWaffen_Info;
	permanent	 = 	FALSE;
	description	 = 	"O� trouvez-vous vos armes ?";
};
func int DIA_Hakon_WoWaffen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Hakon_Paladine))
	{
		return TRUE;
	};
};
func void DIA_Hakon_WoWaffen_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_12"); //D'o� faites-vous venir vos armes�?
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_13"); //De nulle part�! Je me fournissais aupr�s d'Harad.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_14"); //Je me fournissais aupr�s d'Harad, le forgeron.
	};
	AI_Output (self ,other,"DIA_Hakon_Add_12_15"); //Mais maintenant, il travaille exclusivement pour les paladins.
	AI_Output (self ,other,"DIA_Hakon_Add_12_16"); //Il travaille gratuitement pour eux nuit et jour, tel un fou. Il est persuad� que c'est son devoir.
	AI_Output (self ,other,"DIA_Hakon_Add_12_17"); //Je ne peux vous offrir que ce qu'il me reste en stock.
};

// ********************************************************
// 						HaradBandits
// ********************************************************
instance DIA_Hakon_HaradBandits		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	5;
	condition	 = 	DIA_Hakon_HaradBandits_Condition;
	information	 = 	DIA_Hakon_HaradBandits_Info;
	permanent	 = 	FALSE;
	description	 = 	"Harad m'a parl� de l'attaque des bandits...";
};
func int DIA_Hakon_HaradBandits_Condition ()
{
	if (Harad_HakonMission == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Hakon_HaradBandits_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_18"); //Harad m'a parl� des attaques perp�tr�es par les brigands.
	AI_Output (self ,other,"DIA_Hakon_Add_12_19"); //Oh. Et�?
	AI_Output (other, self,"DIA_Hakon_Add_15_20"); //Il donnera son accord pour que je sois accept� comme apprenti si je retrouve les brigands.
	AI_Output (self ,other,"DIA_Hakon_Add_12_21"); //(�clate de rire) Ce bon vieux Harad�! Ce doit �tre sa mani�re � lui de me faire savoir qu'il est dans l'incapacit� de me fabriquer des armes pour le moment.
};

///////////////////////////////////////////////////////////////////////
//	Info Banditen
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Banditen		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	6;
	condition	 = 	DIA_Hakon_Banditen_Condition;
	information	 = 	DIA_Hakon_Banditen_Info;
	permanent	 = 	FALSE;
	description	 = 	"Que savez-vous au sujet des bandits ?";
};
func int DIA_Hakon_Banditen_Condition ()
{
	if (Npc_KnowsInfo (hero, DIA_Hakon_HaradBandits))
	|| (Npc_KnowsInfo (hero, DIA_Hakon_OutOfTown))
	{
		return TRUE;
	};
};
func void DIA_Hakon_Banditen_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Banditen_15_00"); //Que savez-vous au sujet des brigands�?
	AI_Output (self, other, "DIA_Hakon_Banditen_12_01"); //Ce que je sais � leur sujet�? Ils m'ont d�valis� avant que j'arrive en ville�!
	AI_Output (self, other, "DIA_Hakon_Banditen_12_02"); //Et je ne suis pas le seul dans ce cas. Cela fait un moment qu'ils font des leurs...
	AI_Output (self, other, "DIA_Hakon_Banditen_12_03"); //La milice a bien essay� de les retrouver, mais sans succ�s.

	MIS_HakonBandits = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_HakonBanditen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HakonBanditen,LOG_RUNNING);
	B_LogEntry(TOPIC_HakonBanditen,"Hakon, le vendeur d'armes, a �t� attaqu� par des bandits � l'ext�rieur de la ville." );
};


///////////////////////////////////////////////////////////////////////
//	WIEVIEL
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Wieviel		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	6;
	condition	 = 	DIA_Hakon_Wieviel_Condition;
	information	 = 	DIA_Hakon_Wieviel_Info;
	permanent	 = 	FALSE;
	description	 = 	"Je vais m'en occuper...";
};
func int DIA_Hakon_Wieviel_Condition ()
{
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Wieviel_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Banditen_Ehre_15_00"); //Je m'en occupe.
	AI_Output (self, other, "DIA_Hakon_Banditen_Kohle_12_01"); //Quoi�? Vous voulez vous charger des brigands�? Tout seul�? J'imagine que vous devez savoir vous battre, alors...
	AI_Output (other, self, "DIA_Hakon_Banditen_Kohle_15_00"); //Combien seriez-vous pr�t � me donner pour que je le fasse�?
	
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_25"); //(rus�) Vous voulez entrer dans les bonnes gr�ces d'Harad, n'est-ce pas�?
		AI_Output (self ,other,"DIA_Hakon_Add_12_26"); //Je ne vois pas pourquoi je devrais vous payer pour �a.
	}
	else
	{
		AI_Output (self, other, "DIA_Hakon_Banditen_Ehre_12_01"); //Il est vrai que c'est une entreprise dangereuse...
		AI_Output (self, other, "DIA_Hakon_Banditen_Kohle_12_02"); //D'accord. Je vous paierai 100 pi�ces d'or si vous venez � bout des brigands.
		MIS_HakonBanditsPay = TRUE;
	};
	
	Info_ClearChoices (DIA_Hakon_Banditen);
};

///////////////////////////////////////////////////////////////////////
//	Info Miliz
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Miliz		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	4;
	condition	 = 	DIA_Hakon_Miliz_Condition;
	information	 = 	DIA_Hakon_Miliz_Info;
	permanent	 = 	FALSE;
	description	 = 	"Savez-vous qui, au sein de la milice, a pris part aux recherches ?";
};

func int DIA_Hakon_Miliz_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Miliz_Info ()
{
	
	AI_Output (other, self, "DIA_Hakon_Miliz_15_00"); //Savez-vous quels sont les miliciens qui ont pris part aux recherches�?
	AI_Output (self, other, "DIA_Hakon_Miliz_12_01"); //L'un d'eux s'appelle Pablo. Il est parti � la recherche des brigands avec plusieurs de ses compagnons, mais ils ne les ont pas trouv�s.
	AI_Output (other, self, "DIA_Hakon_Miliz_15_02"); //Savez-vous o� je peux trouver ce Pablo�?
	AI_Output (self, other, "DIA_Hakon_Miliz_12_03"); //Il patrouille en ville. Vous le trouverez soit sur la place du temple soit dans le bas quartier.
	
	B_LogEntry(TOPIC_HakonBanditen,"Pablo, un garde de la ville, a particip� � la vaine recherche des bandits." );
};
///////////////////////////////////////////////////////////////////////
//	Info Wo
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Wo		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	5;
	condition	 = 	DIA_Hakon_Wo_Condition;
	information	 = 	DIA_Hakon_Wo_Info;
	permanent	 = 	FALSE;
	description	 = 	"O� vous ont-ils attaqu� ?";
};

func int DIA_Hakon_Wo_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Wo_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Wo_15_00"); //O� les brigands vous ont-ils agress�?
	AI_Output (self, other, "DIA_Hakon_Wo_12_01"); //A proximit� de la ferme d'Akil. Pour y arriver, il suffit de prendre la route de droite � la sortie de la ville.
	AI_Output (self, other, "DIA_Hakon_Wo_12_02"); //Au bout de quelque temps, vous devriez apercevoir quelques marches. C'est l� que ces fumiers m'ont attaqu�. Je parie que leur cachette se trouve non loin, dans les bois.
};
///////////////////////////////////////////////////////////////////////
//	Info Miliz
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Success		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_Success_Condition;
	information	 = 	DIA_Hakon_Success_Info;
	permanent	 = 	FALSE;
	description	 = 	"Je me suis charg� des bandits.";
};

func int DIA_Hakon_Success_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	&& (Npc_IsDead (Bandit_1))
	&& (Npc_IsDead (Bandit_2))
	&& (Npc_IsDead (Bandit_3))
	
	{
		return TRUE;
	};
};
func void DIA_Hakon_Success_Info ()
{
	
	AI_Output (other, self, "DIA_Hakon_Success_15_00"); //Je me suis occup� des brigands.
	AI_Output (self ,other,"DIA_Hakon_Add_12_27"); //C'est vrai�? N'importe qui pourrait le pr�tendre. Il me faudrait une preuve.
	AI_Output (other, self,"DIA_Hakon_Add_15_28"); //(soupire) Vous voulez que je retourne leur couper la t�te afin de vous les ramener�?
	AI_Output (self ,other,"DIA_Hakon_Add_12_29"); //(rapidement) Euh... non, ce ne sera pas n�cessaire. Je vous crois.
	AI_Output (self, other, "DIA_Hakon_Success_12_01"); //Vous venez de rendre un grand service aux marchands et � la ville.
	
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_30"); //Harad en sera tr�s satisfait... enfin, je crois.
	};
		
	if (MIS_HakonBanditsPay == TRUE)
	{	
		AI_Output (self, other, "DIA_Hakon_Success_12_02"); //Voici l'argent promis.
		B_GiveInvItems (self, other, ItMi_Gold,100);
	};
	MIS_HakonBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_Hakon_Bandits); 
	
};

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Hakon_Minenanteil (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 3;
	condition	= DIA_Hakon_Minenanteil_Condition;
	information	= DIA_Hakon_Minenanteil_Info;
	permanent	= FALSE;
	description = "O� avez-vous trouv� ces concessions mini�res que vous vendez ?";
};   
                    
FUNC INT DIA_Hakon_Minenanteil_Condition()
{	
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Hakon_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Hakon_Minenanteil_15_00"); //D'o� tenez-vous ces concessions mini�res que vous vendez�?
	AI_Output (self, other, "DIA_Hakon_Minenanteil_12_01"); //Je regrette, mais je ne peux pas vous le dire. Ce serait trop dangereux pour moi.
	B_GivePlayerXP (XP_Ambient);
};	


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hakon_PICKPOCKET (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 900;
	condition	= DIA_Hakon_PICKPOCKET_Condition;
	information	= DIA_Hakon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Hakon_PICKPOCKET_Condition()
{
	C_Beklauen (45, 65);
};
 
FUNC VOID DIA_Hakon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hakon_PICKPOCKET);
	Info_AddChoice		(DIA_Hakon_PICKPOCKET, DIALOG_BACK 		,DIA_Hakon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hakon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hakon_PICKPOCKET_DoIt);
};

func void DIA_Hakon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hakon_PICKPOCKET);
};
	
func void DIA_Hakon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hakon_PICKPOCKET);
};


// ************************************************************
// 			  				Kapitel2
// ************************************************************

INSTANCE DIA_Hakon_Kapitel2 (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 5;
	condition	= DIA_Hakon_Kapitel2_Condition;
	information	= DIA_Hakon_Kapitel2_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Hakon_Kapitel2_Condition()
{
	if (Kapitel >= 2)
	&& (Canthar_Sperre == FALSE)
	&& (self.aivar[AIV_TalkedToPlayer] == TRUE) 
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hakon_Kapitel2_Info()
{	
	AI_Output (self ,other,"DIA_Hakon_Add_12_22"); //Encore vous !
	AI_Output (self ,other,"DIA_Hakon_Add_12_23"); //Harad a enfin termin� de travailler pour les paladins.
	AI_Output (self ,other,"DIA_Hakon_Add_12_24"); //Cela signifie que je peux enfin vous proposer de nouvelles armes. �a vous int�resse�?
};
