///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Erol_EXIT   (C_INFO)
{
	npc         = VLK_4303_Addon_Erol;
	nr          = 999;
	condition   = DIA_Addon_Erol_EXIT_Condition;
	information = DIA_Addon_Erol_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Erol_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Erol_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Erol_PICKPOCKET (C_INFO)
{
	npc			= VLK_4303_Addon_Erol;
	nr			= 900;
	condition	= DIA_Addon_Erol_PICKPOCKET_Condition;
	information	= DIA_Addon_Erol_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Erol_PICKPOCKET_Condition()
{
	C_Beklauen (43, 42);
};
 
FUNC VOID DIA_Addon_Erol_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Erol_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Erol_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Erol_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Erol_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Erol_PICKPOCKET_DoIt);
};

func void DIA_Addon_Erol_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Erol_PICKPOCKET);
};
	
func void DIA_Addon_Erol_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Erol_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Hallo		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_Hallo_Condition;
	information	 = 	DIA_Addon_Erol_Hallo_Info;

	description	 = 	"Quel est le problème ??";
};

func int DIA_Addon_Erol_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Hallo_15_00"); //Que se passe-t-il ?
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_01"); //(en colère) Ce qui se passe ? Regardez donc ce bazar sous le pont !
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_02"); //(en colère) Je n'ai jamais rien vu de pareil de toute ma vie. Il faudrait exterminer ces pourceaux, je vous le dis !
};

///////////////////////////////////////////////////////////////////////
//	Info what
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_what		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_what_Condition;
	information	 = 	DIA_Addon_Erol_what_Info;

	description	 = 	"Que s'est-il passé ?";
};

func int DIA_Addon_Erol_what_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_what_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_what_15_00"); //Que s'est-il passé ?
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_01"); //Je voyageais avec mes assistants quand ces brutes nous sont tombées dessus sans crier gare et ont massacré tout le monde.
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_02"); //Heureusement que je sais encore me servir de mon crochet du droit sinon ils m'auraient tué aussi.

	Log_CreateTopic (TOPIC_Addon_Erol, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Erol,"Le marchand Erol a été attaqué par plusieurs bandits, qui lui ont dérobé tous ses biens. Les bandits qui occupent le pont près de la Taverne de la harpie morte possèdent toujours ses précieuses tablettes de pierre. Erol veut les récupérer."); 

	MIS_Addon_Erol_BanditStuff = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Erol_what);
	Info_AddChoice	(DIA_Addon_Erol_what, "Les affaires sous le pont sont à vous ?", DIA_Addon_Erol_what_dein );
	Info_AddChoice	(DIA_Addon_Erol_what, "Qui étaient ces gens ?", DIA_Addon_Erol_what_wer );
};
func void DIA_Addon_Erol_what_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_what);
};
func void DIA_Addon_Erol_what_dein ()
{
	AI_Output (other, self, "DIA_Addon_Erol_what_dein_15_00"); //Les affaires sous le pont sont à vous ?
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_01"); //Le chariot, les marchandises, tout.
	if (Npc_HasItems (other, itmi_erolskelch) > 0)
	{
		AI_Output (other, self, "DIA_Addon_Erol_what_dein_Add_15_00"); //Tenez, j'ai récupéré une partie de vos marchandises
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_01"); //Vous pouvez les garder. Elles n'ont aucune valeur pour moi.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_02"); //Elles n'ont aucune valeur pour moi.
	};
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_02"); //Les seules choses de valeur, ce sont les trois tablettes de pierre qu'ils m'ont volées.

	Info_AddChoice	(DIA_Addon_Erol_what, DIALOG_BACK, DIA_Addon_Erol_what_back );
	Info_AddChoice	(DIA_Addon_Erol_what, "Des tablettes de pierre ?", DIA_Addon_Erol_what_Was );
};
func void DIA_Addon_Erol_what_Was ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_Was_15_00"); //Des tablettes de pierre ?
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_01"); //Le Mage de l'eau en ville voulait les acheter et je lui avait promis de me les procurer.
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_02"); //Je dois les récupérer à tout prix, sinon c'en est fini de ma réputation.

	Info_AddChoice	(DIA_Addon_Erol_what, "Où avez-vous trouvé ces tablettes de pierre ?", DIA_Addon_Erol_what_woher );
	Info_AddChoice	(DIA_Addon_Erol_what, "Qu'est-ce qu'un Mage de l'eau voudrait en faire ?", DIA_Addon_Erol_what_KDW );
};
func void DIA_Addon_Erol_what_KDW ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_KDW_15_00"); //Qu'est-ce qu'un Mage de l'eau voudrait en faire ?
	AI_Output			(self, other, "DIA_Addon_Erol_what_KDW_10_01"); //Il m'a dit qu'il voulait les étudier et m'a demandé de lui en procurer d'autres.
};
func void DIA_Addon_Erol_what_woher ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_woher_15_00"); //Où avez-vous trouvé ces tablettes de pierre ?
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_01"); //Je les ai trouvées près de vieux bâtiments, comme des mausolées, ou au fond de cavernes.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_02"); //J'en ai déjà vendu tout un tas au Mage de l'eau en ville.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_03"); //Elles sont rares par ici. La plupart de celles que j'ai trouvées étaient au nord-est de Khorinis.

	Info_AddChoice	(DIA_Addon_Erol_what, "Pourquoi ne pas aller tout simplement en chercher d'autres ?", DIA_Addon_Erol_what_neue );
};
func void DIA_Addon_Erol_what_neue ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_neue_15_00"); //Pourquoi ne pas aller tout simplement en chercher d'autres ?
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_01"); //Je me suis foulé la cheville pendant la bagarre avec les bandits.
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_02"); //Je peux clopiner mais je peux pas aller très loin avec ce pied.
};
func void DIA_Addon_Erol_what_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_wer_15_00"); //Qui étaient ces gens ?
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_01"); //Des bandits. Qui d'autre ? Ils ont pris le pont là-bas.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_02"); //Ils volent tous ceux qui veulent passer le pont.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_03"); //Je savais qu'ils rôdaient par ici, alors j'ai décidé de passer sous le pont.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_04"); //Mais mon chariot et les marchandises leur ont paru trop tentants, sans doute.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_05"); //Ces vermines ont tout simplement sauté du pont directement sur mon chariot.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_06"); //J'aurais dû essayer de passer discrètement de nuit
};

///////////////////////////////////////////////////////////////////////
//	Info FernandosWeapons
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_FernandosWeapons		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_FernandosWeapons_Condition;
	information	 = 	DIA_Addon_Erol_FernandosWeapons_Info;

	description	 = 	"Je cherche des informations sur une livraison d'armes faite aux bandits.";
};

func int DIA_Addon_Erol_FernandosWeapons_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_what))
 	&& (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)	
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_FernandosWeapons_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_FernandosWeapons_15_00"); //Je cherche des informations sur une livraison d'armes faite aux bandits.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_01"); //Une livraison d'armes ? J'en ai entendu parler. Il y a une crapule en ville qui leur en a vendu tellement qu'ils pouvaient à peine les porter.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_02"); //Une partie de leur stock se trouve sur le pont où ils m'ont attaqué.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_03"); //Il ont sûrement emmené le reste dans les pâturages d'altitude derrière la ferme de Bengar.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_04"); //Les bandits voulaient peut-être leur faire franchir le col.
	
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, DIALOG_BACK, DIA_Addon_Erol_FernandosWeapons_back );
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, "Où sont ces pâtures d'altitude ?", DIA_Addon_Erol_FernandosWeapons_bengar );
};
func void DIA_Addon_Erol_FernandosWeapons_bengar ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_FernandosWeapons_bengar_15_00"); //Où sont ces pâtures d'altitude ?
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_01"); //La taverne d'Orlan est située pratiquement au centre de l'île. Elle s'appelle 'La Harpie Morte'.
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_02"); //De là, il y a un chemin vers le sud qui conduit aux pâturages d'altitude et au col permettant d'accéder à la Vallée des mines..
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
};

func void DIA_Addon_Erol_FernandosWeapons_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
};


///////////////////////////////////////////////////////////////////////
//	Info Stoneplates
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Stoneplates		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_Stoneplates_Condition;
	information	 = 	DIA_Addon_Erol_Stoneplates_Info;
	permanent	 = 	TRUE;

	description	 = 	"A propos des tablettes de pierre...";
};

func int DIA_Addon_Erol_Stoneplates_Condition ()
{
	if (MIS_Addon_Erol_BanditStuff == LOG_RUNNING)
		{
			return TRUE;
		};
};

var int StoneplatesCounter;
const int Addon_ErolsStoneplatesOffer = (Value_StonePlateCommon + 5); //Joly:Kohle für eine StonePlateCommon

func void DIA_Addon_Erol_Stoneplates_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Stoneplates_15_00"); //À propos de ces tablettes de pierre

	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
			var int StoneplatesCount;
			var int XP_Addon_BringStoneplates;
			var int StoneplatesGeld;
		
			
			StoneplatesCount = Npc_HasItems(other, ItWr_StonePlateCommon_Addon);
		
		
			if (StoneplatesCount == 1)
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_01"); //J'en ai une avec moi.
					B_GivePlayerXP (XP_Addon_BringStoneplate);
					B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, 1);
				
					StoneplatesCounter = StoneplatesCounter + 1;
					
				}
				else
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_02"); //J'en ai trouvé.
		
					if ((StoneplatesCount + StoneplatesCounter) >= 3)
					{
						B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, 3 - StoneplatesCounter);
						XP_Addon_BringStoneplates = ((3 - StoneplatesCounter) * XP_Addon_BringStoneplate);
						StoneplatesCounter = 3;
					}
					else
					{
						B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, StoneplatesCount);
						XP_Addon_BringStoneplates = (StoneplatesCount * XP_Addon_BringStoneplate);
						StoneplatesCounter = (StoneplatesCounter + StoneplatesCount); 
					};
					B_GivePlayerXP (XP_Addon_BringStoneplates);
				};
				
				
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_03"); //Merci.
		
			if (StoneplatesCounter == 1)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_04"); //Il m'en manque encore deux.
			}
			else if	(StoneplatesCounter == 2)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_05"); //Il ne m'en manque plus qu'une.
			}
			else // mindestens 3 Steintafeln hat er schon.
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_06"); //C'est parfait. Je peux maintenant tenir la promesse que j'ai faite au Mage de l'eau et enfin renter à la maison.
				
				MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
		
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_07"); //Je vous les paierai, bien sûr.

			StoneplatesGeld	= (Addon_ErolsStoneplatesOffer * Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));
		
			CreateInvItems (self, ItMi_Gold, StoneplatesGeld); 
			B_GiveInvItems (self, other, ItMi_Gold, StoneplatesGeld);
			
			Npc_RemoveInvItems	(self ,ItWr_StonePlateCommon_Addon 	, Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));//Joly: weil er zum Händler wird.
			
			if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_08"); //Je rentre chez moi. Accompagnez-moi si vous voulez.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_09"); //Je pourrais peut-être vous vendre quelque chose d'intéressant une fois là-bas.
				
				AI_StopProcessInfos (self);
				AI_UseMob			(self,"BENCH",-1);
				AI_GotoWP 			(self,"NW_TAVERN_TO_FOREST_03");
				Npc_ExchangeRoutine	(self,"Start");
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
	}
	else
	{
			if (C_ScHasMagicStonePlate () == TRUE)
			{
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_10"); //Et celle-ci ?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_11"); //Non. Elle ne convient pas. Les tablettes sont chargées magiquement.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_12"); //Hélas, le Mage de l'eau n'achètera pas ce genre de tablette.
			}
			else
			{			
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_13"); //Combien y en avait-il ?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_14"); //Pour sauver ma réputation auprès du Mage de l'eau, il me faut 3 tablettes.
			}; 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Buerger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Buerger		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_Buerger_Condition;
	information	 = 	DIA_Addon_Erol_Buerger_Info;

	description	 = 	"Êtes-vous citoyen de la ville ?";
};

func int DIA_Addon_Erol_Buerger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_Buerger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Buerger_15_00"); //Êtes-vous citoyen de la ville ?
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_01"); //Cela fait longtemps que je n'y suis pas allé. Je n'ai pas de tendresse particulière pour le porc corrompu qui réside dans le haut quartier.
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_02"); //J'avais des relations là-bas, vous savez. Mais c'était il y a des mois de cela.
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_PreTeach		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_PreTeach_Condition;
	information	 = 	DIA_Addon_Erol_PreTeach_Info;

	description	 = 	"Vous avez réussi à repousser les bandits ?";
};

func int DIA_Addon_Erol_PreTeach_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_what))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_PreTeach_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_00"); //Vous avez réussi à repousser les bandits ?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_01"); //Oui. Mais je suis sûr qu'ils se cachent encore sur le pont.
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_02"); //Vous pourriez m'apprendre à cogner comme ça ?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_03"); //Bien sûr.
	Erol_Addon_TeachPlayer = TRUE;
	Log_CreateTopic (Topic_OutTeacher,LOG_NOTE);
	B_LogEntry (Topic_OutTeacher, LogText_Addon_Erol_Teach);
};

///////////////////////////////////////////////////////////////////////
//	Info PreTrade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_PreTrade		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	100;
	condition	 = 	DIA_Addon_Erol_PreTrade_Condition;
	information	 = 	DIA_Addon_Erol_PreTrade_Info;
	permanent	 = 	TRUE;

	description	 = 	"Montrez-moi vos marchandises.";
};

func int DIA_Addon_Erol_PreTrade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_what))
	&& (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01")>2000)
	
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_PreTrade_Info ()
{
	B_Say (other,self,"$TRADE_2");
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_00"); //Je n'ai rien à vous vendre. Toutes mes marchandises sont là, éparpillées sous le pont.
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_01"); //Je ne pourrai vous vendre quelque chose qu'une fois rentré à la maison.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_02"); //Mais je n'y retournerai pas tant que je n'aurai pas récupéré mes tablettes.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SLD
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_SLD		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_SLD_Condition;
	information	 = 	DIA_Addon_Erol_SLD_Info;

	description	 = 	"Où est votre cabane ?";
};

func int DIA_Addon_Erol_SLD_Condition ()
{
	if	((Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01")<2000) )
		{
			return TRUE;
		};
};
var int Erol_IsAtHome;
func void DIA_Addon_Erol_SLD_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_00"); //(surpris) C'est ça, votre hutte ?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_01"); //Oui. Pourquoi ? Il y a un problème ?
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_02"); //Vous n'avez pas de problèmes avec les mercenaires ?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_03"); //Tant que je ne me mêle pas de leurs affaires, ils me laissent tranquille.
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_04"); //De plus ce sont de bons clients et je les paie pour qu'ils jettent un œil sur ma maison quand je ne suis pas là.
	B_GivePlayerXP (XP_Ambient);
	if (Erol_IsAtHome == FALSE)
	{
		Npc_ExchangeRoutine	(self,"HOME");
		Erol_IsAtHome = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Trade		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	100;
	condition	 = 	DIA_Addon_Erol_Trade_Condition;
	information	 = 	DIA_Addon_Erol_Trade_Info;
	Trade 		 = 	TRUE;
	permanent	 = 	TRUE;
	description	 = 	"Montrez-moi vos marchandises.";
};

func int DIA_Addon_Erol_Trade_Condition ()
{
	if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
	&& ((Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01")<3000) )
	{
		return TRUE;
	};
};
var int DIA_Addon_Erol_Trade_OneTime;
func void DIA_Addon_Erol_Trade_Info ()
{
	B_GiveTradeInv (self);
	B_Say (other,self,"$TRADE_2");
	AI_Output	(self, other, "DIA_Addon_Erol_Trade_10_00"); //Nous n'avons pas tellement le choix, je crois.
	
	if (Erol_IsAtHome == FALSE)
	{
		Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
		B_LogEntry (Topic_OutTrader, LogText_Addon_ErolTrade);

		Npc_ExchangeRoutine	(self,"Home");
		Erol_IsAtHome = TRUE;
	};
};

//*******************************************
//	TeachPlayer
//*******************************************

INSTANCE DIA_Addon_Erol_Teach(C_INFO)
{
	npc			= VLK_4303_Addon_Erol;
	nr			= 99;
	condition	= DIA_Addon_Erol_Teach_Condition;
	information	= DIA_Addon_Erol_Teach_Info;
	permanent	= TRUE;
	description = "Montrez-moi comment frapper plus fort.";
};                       

FUNC INT DIA_Addon_Erol_Teach_Condition()
{
	if (Erol_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Erol_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Erol_Teach_15_00"); //Montrez-moi comment frapper plus fort.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_01"); //D'accord, mais vous aurez une dette envers moi.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_02"); //Aidez-moi à sauver ma réputation en me rapportant mes tablettes de pierre.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_03"); //Ensuite je vous montrerai comment bien utiliser votre force au combat.
	}
	else if (Erol_Bonus == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_00"); //Bon. Soyez attentif. Voici un truc tout simple.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_01"); //Quand vous frappez, ne vous contentez pas de la force de votre bras. Utilisez tout votre corps.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_02"); //Faites pivoter vos hanches, penchez les épaules en avant et détendez votre bras en même temps.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_03"); //(rit) Si vous frappez juste, vous verrez la différence !
		B_RaiseAttribute (other, ATR_STRENGTH, 1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_04"); //Si vous voulez en apprendre plus, il faudra vous entraîner durement
		Info_ClearChoices (DIA_Addon_Erol_Teach);
		Info_AddChoice		(DIA_Addon_Erol_Teach, DIALOG_BACK, DIA_Addon_Erol_Teach_Back);
		Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Addon_Erol_Teach_STR_1);
		Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Addon_Erol_Teach_STR_5);
	};
};

FUNC VOID DIA_Addon_Erol_Teach_Back ()
{
	Info_ClearChoices (DIA_Addon_Erol_Teach);
};

FUNC VOID DIA_Addon_Erol_Teach_STR_1 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MAX);
	
	Info_ClearChoices 	(DIA_Addon_Erol_Teach);
	Info_AddChoice		(DIA_Addon_Erol_Teach, DIALOG_BACK, DIA_Addon_Erol_Teach_Back);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Addon_Erol_Teach_STR_5);
};

FUNC VOID DIA_Addon_Erol_Teach_STR_5 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MAX);
	
	Info_ClearChoices 	(DIA_Addon_Erol_Teach);
	Info_AddChoice		(DIA_Addon_Erol_Teach, DIALOG_BACK, DIA_Addon_Erol_Teach_Back);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Addon_Erol_Teach_STR_5);
};






