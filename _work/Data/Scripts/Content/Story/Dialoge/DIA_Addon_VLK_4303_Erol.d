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

	description	 = 	"Quel est le probl�me ??";
};

func int DIA_Addon_Erol_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Hallo_15_00"); //Que se passe-t-il ?
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_01"); //(en col�re) Ce qui se passe ? Regardez donc ce bazar sous le pont !
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_02"); //(en col�re) Je n'ai jamais rien vu de pareil de toute ma vie. Il faudrait exterminer ces pourceaux, je vous le dis !
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

	description	 = 	"Que s'est-il pass� ?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_what_15_00"); //Que s'est-il pass� ?
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_01"); //Je voyageais avec mes assistants quand ces brutes nous sont tomb�es dessus sans crier gare et ont massacr� tout le monde.
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_02"); //Heureusement que je sais encore me servir de mon crochet du droit sinon ils m'auraient tu� aussi.

	Log_CreateTopic (TOPIC_Addon_Erol, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Erol,"Le marchand Erol a �t� attaqu� par plusieurs bandits, qui lui ont d�rob� tous ses biens. Les bandits qui occupent le pont pr�s de la Taverne de la harpie morte poss�dent toujours ses pr�cieuses tablettes de pierre. Erol veut les r�cup�rer."); 

	MIS_Addon_Erol_BanditStuff = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Erol_what);
	Info_AddChoice	(DIA_Addon_Erol_what, "Les affaires sous le pont sont � vous ?", DIA_Addon_Erol_what_dein );
	Info_AddChoice	(DIA_Addon_Erol_what, "Qui �taient ces gens ?", DIA_Addon_Erol_what_wer );
};
func void DIA_Addon_Erol_what_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_what);
};
func void DIA_Addon_Erol_what_dein ()
{
	AI_Output (other, self, "DIA_Addon_Erol_what_dein_15_00"); //Les affaires sous le pont sont � vous ?
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_01"); //Le chariot, les marchandises, tout.
	if (Npc_HasItems (other, itmi_erolskelch) > 0)
	{
		AI_Output (other, self, "DIA_Addon_Erol_what_dein_Add_15_00"); //Tenez, j'ai r�cup�r� une partie de vos marchandises
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_01"); //Vous pouvez les garder. Elles n'ont aucune valeur pour moi.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_02"); //Elles n'ont aucune valeur pour moi.
	};
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_02"); //Les seules choses de valeur, ce sont les trois tablettes de pierre qu'ils m'ont vol�es.

	Info_AddChoice	(DIA_Addon_Erol_what, DIALOG_BACK, DIA_Addon_Erol_what_back );
	Info_AddChoice	(DIA_Addon_Erol_what, "Des tablettes de pierre ?", DIA_Addon_Erol_what_Was );
};
func void DIA_Addon_Erol_what_Was ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_Was_15_00"); //Des tablettes de pierre ?
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_01"); //Le Mage de l'eau en ville voulait les acheter et je lui avait promis de me les procurer.
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_02"); //Je dois les r�cup�rer � tout prix, sinon c'en est fini de ma r�putation.

	Info_AddChoice	(DIA_Addon_Erol_what, "O� avez-vous trouv� ces tablettes de pierre ?", DIA_Addon_Erol_what_woher );
	Info_AddChoice	(DIA_Addon_Erol_what, "Qu'est-ce qu'un Mage de l'eau voudrait en faire ?", DIA_Addon_Erol_what_KDW );
};
func void DIA_Addon_Erol_what_KDW ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_KDW_15_00"); //Qu'est-ce qu'un Mage de l'eau voudrait en faire ?
	AI_Output			(self, other, "DIA_Addon_Erol_what_KDW_10_01"); //Il m'a dit qu'il voulait les �tudier et m'a demand� de lui en procurer d'autres.
};
func void DIA_Addon_Erol_what_woher ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_woher_15_00"); //O� avez-vous trouv� ces tablettes de pierre ?
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_01"); //Je les ai trouv�es pr�s de vieux b�timents, comme des mausol�es, ou au fond de cavernes.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_02"); //J'en ai d�j� vendu tout un tas au Mage de l'eau en ville.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_03"); //Elles sont rares par ici. La plupart de celles que j'ai trouv�es �taient au nord-est de Khorinis.

	Info_AddChoice	(DIA_Addon_Erol_what, "Pourquoi ne pas aller tout simplement en chercher d'autres ?", DIA_Addon_Erol_what_neue );
};
func void DIA_Addon_Erol_what_neue ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_neue_15_00"); //Pourquoi ne pas aller tout simplement en chercher d'autres ?
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_01"); //Je me suis foul� la cheville pendant la bagarre avec les bandits.
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_02"); //Je peux clopiner mais je peux pas aller tr�s loin avec ce pied.
};
func void DIA_Addon_Erol_what_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_wer_15_00"); //Qui �taient ces gens ?
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_01"); //Des bandits. Qui d'autre ? Ils ont pris le pont l�-bas.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_02"); //Ils volent tous ceux qui veulent passer le pont.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_03"); //Je savais qu'ils r�daient par ici, alors j'ai d�cid� de passer sous le pont.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_04"); //Mais mon chariot et les marchandises leur ont paru trop tentants, sans doute.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_05"); //Ces vermines ont tout simplement saut� du pont directement sur mon chariot.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_06"); //J'aurais d� essayer de passer discr�tement de nuit
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
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_01"); //Une livraison d'armes ? J'en ai entendu parler. Il y a une crapule en ville qui leur en a vendu tellement qu'ils pouvaient � peine les porter.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_02"); //Une partie de leur stock se trouve sur le pont o� ils m'ont attaqu�.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_03"); //Il ont s�rement emmen� le reste dans les p�turages d'altitude derri�re la ferme de Bengar.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_04"); //Les bandits voulaient peut-�tre leur faire franchir le col.
	
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, DIALOG_BACK, DIA_Addon_Erol_FernandosWeapons_back );
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, "O� sont ces p�tures d'altitude ?", DIA_Addon_Erol_FernandosWeapons_bengar );
};
func void DIA_Addon_Erol_FernandosWeapons_bengar ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_FernandosWeapons_bengar_15_00"); //O� sont ces p�tures d'altitude ?
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_01"); //La taverne d'Orlan est situ�e pratiquement au centre de l'�le. Elle s'appelle 'La Harpie Morte'.
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_02"); //De l�, il y a un chemin vers le sud qui conduit aux p�turages d'altitude et au col permettant d'acc�der � la Vall�e des mines..
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
const int Addon_ErolsStoneplatesOffer = (Value_StonePlateCommon + 5); //Joly:Kohle f�r eine StonePlateCommon

func void DIA_Addon_Erol_Stoneplates_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Stoneplates_15_00"); //� propos de ces tablettes de pierre

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
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_02"); //J'en ai trouv�.
		
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
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_06"); //C'est parfait. Je peux maintenant tenir la promesse que j'ai faite au Mage de l'eau et enfin renter � la maison.
				
				MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
		
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_07"); //Je vous les paierai, bien s�r.

			StoneplatesGeld	= (Addon_ErolsStoneplatesOffer * Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));
		
			CreateInvItems (self, ItMi_Gold, StoneplatesGeld); 
			B_GiveInvItems (self, other, ItMi_Gold, StoneplatesGeld);
			
			Npc_RemoveInvItems	(self ,ItWr_StonePlateCommon_Addon 	, Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));//Joly: weil er zum H�ndler wird.
			
			if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_08"); //Je rentre chez moi. Accompagnez-moi si vous voulez.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_09"); //Je pourrais peut-�tre vous vendre quelque chose d'int�ressant une fois l�-bas.
				
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
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_11"); //Non. Elle ne convient pas. Les tablettes sont charg�es magiquement.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_12"); //H�las, le Mage de l'eau n'ach�tera pas ce genre de tablette.
			}
			else
			{			
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_13"); //Combien y en avait-il ?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_14"); //Pour sauver ma r�putation aupr�s du Mage de l'eau, il me faut 3 tablettes.
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

	description	 = 	"�tes-vous citoyen de la ville ?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_Buerger_15_00"); //�tes-vous citoyen de la ville ?
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_01"); //Cela fait longtemps que je n'y suis pas all�. Je n'ai pas de tendresse particuli�re pour le porc corrompu qui r�side dans le haut quartier.
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_02"); //J'avais des relations l�-bas, vous savez. Mais c'�tait il y a des mois de cela.
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

	description	 = 	"Vous avez r�ussi � repousser les bandits ?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_00"); //Vous avez r�ussi � repousser les bandits ?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_01"); //Oui. Mais je suis s�r qu'ils se cachent encore sur le pont.
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_02"); //Vous pourriez m'apprendre � cogner comme �a ?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_03"); //Bien s�r.
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
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_00"); //Je n'ai rien � vous vendre. Toutes mes marchandises sont l�, �parpill�es sous le pont.
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_01"); //Je ne pourrai vous vendre quelque chose qu'une fois rentr� � la maison.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_02"); //Mais je n'y retournerai pas tant que je n'aurai pas r�cup�r� mes tablettes.
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

	description	 = 	"O� est votre cabane ?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_00"); //(surpris) C'est �a, votre hutte ?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_01"); //Oui. Pourquoi ? Il y a un probl�me ?
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_02"); //Vous n'avez pas de probl�mes avec les mercenaires ?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_03"); //Tant que je ne me m�le pas de leurs affaires, ils me laissent tranquille.
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_04"); //De plus ce sont de bons clients et je les paie pour qu'ils jettent un �il sur ma maison quand je ne suis pas l�.
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
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_02"); //Aidez-moi � sauver ma r�putation en me rapportant mes tablettes de pierre.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_03"); //Ensuite je vous montrerai comment bien utiliser votre force au combat.
	}
	else if (Erol_Bonus == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_00"); //Bon. Soyez attentif. Voici un truc tout simple.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_01"); //Quand vous frappez, ne vous contentez pas de la force de votre bras. Utilisez tout votre corps.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_02"); //Faites pivoter vos hanches, penchez les �paules en avant et d�tendez votre bras en m�me temps.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_03"); //(rit) Si vous frappez juste, vous verrez la diff�rence !
		B_RaiseAttribute (other, ATR_STRENGTH, 1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_04"); //Si vous voulez en apprendre plus, il faudra vous entra�ner durement
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






