
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Riordian_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14040_Addon_Riordian_ADW;
	nr          = 999;
	condition   = DIA_Addon_Riordian_ADW_EXIT_Condition;
	information = DIA_Addon_Riordian_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Riordian_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Riordian_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info HelloADW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_HelloADW		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_HelloADW_Condition;
	information	 = 	DIA_Addon_Riordian_HelloADW_Info;

	description	 = 	"C'est ce � quoi vous vous attendiez ?";
};

func int DIA_Addon_Riordian_HelloADW_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Riordian_HelloADW_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_HelloADW_15_00"); //Vous attendiez-vous � trouver ceci, ici ?
	AI_Output	(self, other, "DIA_Addon_Riordian_HelloADW_10_01"); //Pas le moins du monde. Je reste songeur devant la taille de cette ville...
	AI_Output	(self, other, "DIA_Addon_Riordian_HelloADW_10_02"); //La plupart des b�timents sont enfouis sous les roches et la terres, mais les vestiges qui ont travers� les �ges s'�tendent � perte de vue sur ces terres.
	AI_Output	(self, other, "DIA_Addon_Riordian_HelloADW_10_03"); //Des milliers de personnes devaient vivre ici.
};

///////////////////////////////////////////////////////////////////////
//	Info WhatToFind
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_WhatToFind		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_WhatToFind_Condition;
	information	 = 	DIA_Addon_Riordian_WhatToFind_Info;

	description	 = 	"Qu'est-ce que je suis cens� d�couvrir, l�-dehors ?";
};

func int DIA_Addon_Riordian_WhatToFind_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Riordian_HelloADW))
		{
			return TRUE;
		};
};

func void DIA_Addon_Riordian_WhatToFind_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_WhatToFind_15_00"); //Que trouverai-je sur ces terres ?
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_01"); //A l'est se trouve une vaste forteresse, �rig�e au c�ur d'un immense marais.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_02"); //Selon les informations dont nous disposons, des bandits y auraient trouv� refuge.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_03"); //A votre place, je ne m'y rendrais pas. Ils ont �rig� de nombreux postes avanc�s, et y ont post� des sentinelles.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_04"); //Vous avez tout int�r�t � �viter ce marais tant que vous n'aurez pas acquis davantage d'exp�rience, ou du moins � trouver un moyen de contourner les positions des bandits.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_05"); //A l'ouest, nous avons rep�r� des pirates.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_06"); //Je n'en suis pas certain, mais je pense qu'ils sont conscients de notre pr�sence ici.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_07"); //Toutefois, cela ne semble gu�re les inqui�ter outre mesure.
};

///////////////////////////////////////////////////////////////////////
//	Info Gegend
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_Gegend		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_Gegend_Condition;
	information	 = 	DIA_Addon_Riordian_Gegend_Info;
	permanent	 = 	TRUE;

	description	 = 	"Parlez-moi un peu de ces contr�es...";
};

func int DIA_Addon_Riordian_Gegend_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Riordian_WhatToFind))
	&& (Saturas_RiesenPlan == FALSE)
		{
			return TRUE;
		};
};
var int DIA_Addon_Riordian_Gegend_Info_OneTime;
func void DIA_Addon_Riordian_Gegend_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_Gegend_15_00"); //Dites-m'en davantage sur ces lieux.
	AI_Output	(self, other, "DIA_Addon_Riordian_Gegend_10_01"); //Que voulez-vous savoir ?
	
	Info_ClearChoices	(DIA_Addon_Riordian_Gegend);
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, DIALOG_BACK, DIA_Addon_Riordian_Gegend_Back );
	
	if (DIA_Addon_Riordian_Gegend_Info_OneTime == FALSE)
	&& (Npc_HasItems (other,ItWr_Map_AddonWorld) == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Existe-t-il une carte de cette r�gion ?", DIA_Addon_Riordian_Gegend_map );
		DIA_Addon_Riordian_Gegend_Info_OneTime = TRUE;
	};
	
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "O� avez-vous aper�u les pirates ?", DIA_Addon_Riordian_Gegend_Piraten );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "O� se trouvent ces bandits, d�j� ?", DIA_Addon_Riordian_Gegend_bandits );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Vous �tes-vous d�j� rendu dans l'ouest ?", DIA_Addon_Riordian_Gegend_west );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Qu'y a-t-il � l'est ? Je ne me souviens plus.", DIA_Addon_Riordian_Gegend_ost );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Que trouverai-je au sud ?", DIA_Addon_Riordian_Gegend_sued );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Qu'y a-t-il au nord ?", DIA_Addon_Riordian_Gegend_nord );
};
func void DIA_Addon_Riordian_Gegend_Back ()
{
	Info_ClearChoices	(DIA_Addon_Riordian_Gegend);
};
func void DIA_Addon_Riordian_Gegend_map ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_map_15_00"); //Existe-t-il une carte de cette r�gion ?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_map_10_01"); //Cronos en a r�alis� une. Il vous la remettra s�rement.
};
func void DIA_Addon_Riordian_Gegend_bandits ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_bandits_15_00"); //Pouvez-vous me redire o� se trouvent les bandits ?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_bandits_10_01"); //Ils ont �rig� une sorte de fort pourvu de nombreux avant-postes � l'est de ces lieux.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_bandits_10_02"); //Pour les atteindre, vous allez devoir traverser l'immense marais.
};
func void DIA_Addon_Riordian_Gegend_Piraten ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_Piraten_15_00"); //O� avez-vous aper�u les pirates ?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_Piraten_10_01"); //Ils r�daient dans les parages � l'ouest d'ici.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_Piraten_10_02"); //Je crois qu'ils �taient en train de chasser.
};

func void DIA_Addon_Riordian_Gegend_nord ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_nord_15_00"); //Qu'y a-t-il au nord ?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_nord_10_01"); //Si j'en crois les �crits des b�tisseurs, vous trouverez une vaste vall�e cern�e de falaises.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_nord_10_02"); //Ces terres seraient une vaste �tendue de d�serts arides.
};

func void DIA_Addon_Riordian_Gegend_sued ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_sued_15_00"); //Que trouverai-je au sud ?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_sued_10_01"); //Les terres au sud sont tr�s escarp�es.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_sued_10_02"); //Vous y trouverez des chemins tortueux, des chutes d'eau et des vestiges troglodytiques.
};

func void DIA_Addon_Riordian_Gegend_ost ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_ost_15_00"); //Qu'y a-t-il � l'est ? Je ne me souviens plus.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_ost_10_01"); //Le grand marais. Cette r�gion est extr�mement dangereuse.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_ost_10_02"); //Elle grouille non seulement de bandits, mais �galement de cr�atures tr�s f�roces.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_ost_10_03"); //Vous devriez faire attention.
};
var int DIA_Addon_Riordian_Gegend_west_OneTime;
func void DIA_Addon_Riordian_Gegend_west ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_west_15_00"); //Vous �tes-vous d�j� rendu dans l'ouest ?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_west_10_01"); //Non. Mais la c�te de l'�le doit �tre proche de cette r�gion.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_west_10_02"); //C'est vraisemblablement l� que les pirates ont �tabli leur camp.

	if (DIA_Addon_Riordian_Gegend_west_OneTime == FALSE)
	&& (Npc_HasItems (VLK_4304_Addon_William,ITWr_Addon_William_01))
	{
		AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_west_10_03"); //A l'est, non loin d'ici, nous avons retrouv� le corps d'un p�cheur.
		AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_west_10_04"); //Vous devriez l'examiner.
		B_LogEntry (TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche); 
		DIA_Addon_Riordian_Gegend_west_OneTime = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info HousesOfRulers
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_HousesOfRulers		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_HousesOfRulers_Condition;
	information	 = 	DIA_Addon_Riordian_HousesOfRulers_Info;

	description	 = 	"Saturas m'envoie ici.";
};

func int DIA_Addon_Riordian_HousesOfRulers_Condition ()
{
	if (MIS_Saturas_LookingForHousesOfRulers == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_HousesOfRulers_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_HousesOfRulers_15_00"); //Saturas m'envoie ici. Je dois fouiller les cinq demeures de Jharkendar.
	AI_Output	(self, other, "DIA_Addon_Riordian_HousesOfRulers_10_01"); //Il m'a fallu bien du temps pour rep�rer l'emplacement des demeures gr�ce aux �crits des b�tisseurs.
	AI_Output	(self, other, "DIA_Addon_Riordian_HousesOfRulers_10_02"); //Mais maintenant, je peux vous en parler avec certitude.
	MIS_Riordian_HousesOfRulers = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info WhereAreHouses
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_WhereAreHouses		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_WhereAreHouses_Condition;
	information	 = 	DIA_Addon_Riordian_WhereAreHouses_Info;

	description	 = 	"O� puis-je trouver les cinq demeures ?";
};

func int DIA_Addon_Riordian_WhereAreHouses_Condition ()
{
	if (MIS_Riordian_HousesOfRulers == LOG_RUNNING)
	&& (Saturas_SCBroughtAllToken == FALSE)
		{
			return TRUE;
		};
};
var int B_WhreAreHousesOfRulersOneTime;
func void B_WhreAreHousesOfRulers ()
{
	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_00"); //La demeure des �rudits est une vaste biblioth�que. Elle doit se trouver quelque part au nord.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_01"); //La demeure des guerriers �tait une forteresse ceinte de falaises, dans l'est.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_02"); //Les demeures des pr�tres et des veilleurs des morts �taient proches l'une de l'autre. Vous devriez les trouver au sud-ouest d'ici.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_03"); //Quant aux gu�risseurs, leur demeure de convalescence se trouvait au sud-est.

	if (B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_04"); //Si ces demeures ne se sont pas �croul�es, vous les reconna�trez certainement gr�ce � leur architecture.
		B_WhreAreHousesOfRulersOneTime = TRUE;
	};

	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_05"); //Elles sont hautes. Un escalier escarp� m�ne � l'entr�e de la demeure, ceinte de hautes colonnes.

	if (B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_06"); //J'esp�re que cela vous sera utile.
	};

	Log_CreateTopic (TOPIC_Addon_HousesOfRulers, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_HousesOfRulers,"Le manoir des Erudits est une immense biblioth�que. Il se trouve quelque part au nord de cet endroit."); 
	Log_AddEntry (TOPIC_Addon_HousesOfRulers,"La demeure des guerriers �tait une forteresse ceinte d'immenses falaises, � l'est d'ici."); 
	Log_AddEntry (TOPIC_Addon_HousesOfRulers,"Les quartiers des pr�tres et des veilleurs des morts n'�taient gu�re �loign�s les uns des autres. Je devrais les trouver au sud-ouest d'ici."); 
	Log_AddEntry (TOPIC_Addon_HousesOfRulers,"La maison de convalescence des soigneurs se trouvait au sud-est d'ici."); 
};

func void DIA_Addon_Riordian_WhereAreHouses_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_WhereAreHouses_15_00"); //O� puis-je trouver les cinq demeures ?
	B_WhreAreHousesOfRulers ();
};

///////////////////////////////////////////////////////////////////////
//	Info FoundHouse
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_FoundHouse		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_FoundHouse_Condition;
	information	 = 	DIA_Addon_Riordian_FoundHouse_Info;
	permanent	 = 	TRUE;

	description	 = 	"A propos des demeures...";
};

func int DIA_Addon_Riordian_FoundHouse_Condition ()
{
	if (MIS_Riordian_HousesOfRulers == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Riordian_WhereAreHouses))
	&& (RiordianHousesFoundCount < 5)
		{
			return TRUE;
		};
};
var int FOUNDHOUSEINFO[6];
const int Library = 1;
const int Heiler  = 2;
const int Warrior = 3;
const int Priest  = 4;
const int Totenw  = 5;
var int RiordianHouseNeuigkeit;
var int RiordianHousesFoundCount;
func void DIA_Addon_Riordian_FoundHouse_Info ()
{
	RiordianHouseNeuigkeit = 0;
	
	AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_00"); //Heu, � propos des demeures...
	AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_01"); //Oui ?
	
	if (SC_COMESINTO_CANYONLIBRARY_FUNC_OneTime == TRUE)
	&& (FOUNDHOUSEINFO [Library] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_02"); //Les orques semblent s'int�resser de pr�s � la biblioth�que des �rudits.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_03"); //Pensez-vous qu'ils connaissent la langue des anciens ?
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_04"); //Je ne le pense pas... mais qui peut bien savoir ?
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_05"); //Peut-�tre devriez-vous veiller � ce qu'ils s'en �loignent, n�anmoins.
		FOUNDHOUSEINFO[Library] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
		
		Log_CreateTopic (TOPIC_Addon_CanyonOrcs, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_CanyonOrcs, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_CanyonOrcs,"Le Mage de l'eau Riordian pr�f�rerait que les orques soient repouss�s hors du canyon."); 
	};
	
	if ((Npc_IsDead(StoneGuardian_Heiler)) || (Npc_HasItems (other,ItMi_Addon_Stone_04)) || (Saturas_SCFound_ItMi_Addon_Stone_04 == TRUE) )
	&& (FOUNDHOUSEINFO [Heiler] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_06"); //La demeure des soigneurs se trouve au c�ur du marais, et est d�fendue par de nombreuses sentinelles de pierre.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_07"); //Ainsi, elle est toujours debout ?
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_08"); //Oui, mais je me demande pour combien de temps encore...
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_09"); //Je suis navr� de voir d'inestimables vestiges du pass� sombrer dans un tel �tat de d�cr�pitude.
		FOUNDHOUSEINFO[Heiler] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
	};	

	if (RavenIsInTempel == TRUE)
	&& (FOUNDHOUSEINFO [Warrior] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_10"); //La demeure des guerriers est utilis�e comme repaire par Raven.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_11"); //(cynique) Il a fait le bon choix.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_12"); //Il s'agit certainement de la forteresse la plus s�re de cette r�gion.
		FOUNDHOUSEINFO[Warrior] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
	};	

	if ((Npc_IsDead(Minecrawler_Priest)) || (Npc_HasItems (other,ItMi_Addon_Stone_03)) || (Saturas_SCFound_ItMi_Addon_Stone_03 == TRUE))
	&& (FOUNDHOUSEINFO [Priest] == FALSE)//crawler
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_13"); //La demeure des pr�tres grouillait de foreurs...
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_14"); //Ces cr�atures ne sont-elles pas plut�t rares, dans les environs ?
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_15"); //En effet.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_16"); //Par Adanos... d'�tranges �v�nements se produisent dans cette r�gion.
		
		FOUNDHOUSEINFO[Priest] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
	};	

	if ((Npc_IsDead(MayaZombie04_Totenw)) || (Npc_HasItems (other,ItMi_Addon_Stone_02)) || (Saturas_SCFound_ItMi_Addon_Stone_02 == TRUE))
	&& (FOUNDHOUSEINFO [Totenw] == FALSE)//Zombies
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_17"); //La demeure des veilleurs des morts est tomb�e sous l'emprise des puissances du mal.
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_18"); //Je crois n'avoir que rarement vu un aussi grand nombre de zombies dans un m�me endroit.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_19"); //C'est regrettable... Les veilleurs des morts ont vraisemblablement �t� victimes de leurs talents sp�ciaux.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_20"); //Leur lien avec le monde des morts leur a port� un grand pr�judice. J'esp�re que vous avez pu les lib�rer de leurs souffrances...
		FOUNDHOUSEINFO[Totenw] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
	};	
	
	if (RiordianHouseNeuigkeit > 0)
	{
		var int RiordianHouseXPs;
		RiordianHouseXPs = (XP_Addon_Riordian_FoundHouse * RiordianHouseNeuigkeit);
		B_GivePlayerXP (RiordianHouseXPs);
		
		RiordianHousesFoundCount = (RiordianHousesFoundCount + RiordianHouseNeuigkeit);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_21"); //Redites-moi o� se trouve chaque demeure.
		B_WhreAreHousesOfRulers ();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info OrksWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_OrksWeg		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_OrksWeg_Condition;
	information	 = 	DIA_Addon_Riordian_OrksWeg_Info;

	description	 = 	"Les orques ne s'int�resseront gu�re longtemps � cet endroit.";
};

func int DIA_Addon_Riordian_OrksWeg_Condition ()
{
	if (Npc_IsDead(OrcShaman_Sit_CanyonLibraryKey))
	&& (FOUNDHOUSEINFO [Library] == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Riordian_OrksWeg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_OrksWeg_15_00"); //Les orques ne s'int�resseront gu�re longtemps � cet endroit.
	AI_Output	(self, other, "DIA_Addon_Riordian_OrksWeg_10_01"); //Qu'est-ce qui vous fait dire cela ?

	if (OrcShaman_Sit_CanyonLibraryKey.aivar [AIV_KilledByPlayer] == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_OrksWeg_15_02"); //J'ai tu� leur chef.
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_OrksWeg_15_03"); //Leur chef est mort.
	};
	
	AI_Output	(self, other, "DIA_Addon_Riordian_OrksWeg_10_04"); //Esp�rons que vous avez raison...
	AI_Output	(self, other, "DIA_Addon_Riordian_OrksWeg_10_05"); //Nous nous passerions volontiers de ce genre de perturbation, en ce moment.
	
	TOPIC_END_CanyonOrcs = TRUE;
	B_GivePlayerXP (XP_Addon_Riordian_OrksWeg);
};

///////////////////////////////////////////////////////////////////////
//	Info FoundAllHouses
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_FoundAllHouses		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_FoundAllHouses_Condition;
	information	 = 	DIA_Addon_Riordian_FoundAllHouses_Info;

	description	 = 	"J'ai trouv� toutes les demeures.";
};

func int DIA_Addon_Riordian_FoundAllHouses_Condition ()
{
	if (RiordianHousesFoundCount >= 5)
	&& (MIS_Riordian_HousesOfRulers == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Riordian_FoundAllHouses_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_FoundAllHouses_15_00"); //J'ai trouv� toutes les demeures.
	AI_Output	(self, other, "DIA_Addon_Riordian_FoundAllHouses_10_01"); //Se trouvaient-elles toutes aux endroits que je vous avais indiqu�s ?
	AI_Output	(other, self, "DIA_Addon_Riordian_FoundAllHouses_15_02"); //Plus ou moins.
	AI_Output	(self, other, "DIA_Addon_Riordian_FoundAllHouses_10_03"); //Bien ! Mon travail s'est donc av�r� utile.
	AI_Output	(self, other, "DIA_Addon_Riordian_FoundAllHouses_10_04"); //Je vous en remercie.
	MIS_Riordian_HousesOfRulers = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_FoundAllHouses);
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_ADW_PreTeach		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_ADW_PreTeach_Condition;
	information	 = 	DIA_Addon_Riordian_ADW_PreTeach_Info;

	description	 = 	"Pouvez-vous m'enseigner vos connaissances ?";
};

func int DIA_Addon_Riordian_ADW_PreTeach_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Riordian_ADW_PreTeach_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_ADW_PreTeach_15_00"); //Pouvez-vous m'enseigner vos connaissances ?
	AI_Output	(self, other, "DIA_Addon_Riordian_ADW_PreTeach_10_01"); //Je peux vous enseigner l'art de l'alchimie.

	if  (Npc_HasItems (other,ItAm_Addon_WispDetector))
	&& (DIA_Addon_Riordian_Teach_NoPerm == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Riordian_ADW_PreTeach_10_02"); //Et je peux vous montrer comment apprendre � votre lueur spectrale � recherche diff�rents objets.
	
		Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
		Log_AddEntry		(TOPIC_Addon_KDWTeacher, LogText_Addon_RiordianTeach);
	};

	Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry	(TOPIC_Addon_KDWTeacher, LogText_Addon_RiordianTeachAlchemy);

	Riordian_ADW_ADDON_TeachWisp = TRUE;
	Riordian_ADW_ADDON_TeachAlchemy = TRUE;
	
};

instance DIA_Addon_Riordian_ADW_Teach		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Riordian_ADW_Teach_Condition;
	information	 = 	DIA_Addon_Riordian_ADW_Teach_Info;
	permanent	 = 	TRUE;

	description	 = 	"Montrez-moi comment enseigner de nouvelles techniques � ma lueur spectrale.";
};
var int DIA_Addon_Riordian_ADW_Teach_NoPerm;

func int DIA_Addon_Riordian_ADW_Teach_Condition ()
{
	if (DIA_Addon_Riordian_ADW_Teach_NoPerm == FALSE)
	&& (DIA_Addon_Riordian_Teach_NoPerm == FALSE)
	&& (Riordian_ADW_ADDON_TeachWisp == TRUE)
	&& (Npc_HasItems (other,ItAm_Addon_WispDetector))
		{
			return TRUE;
		};
};
func void DIA_Addon_Riordian_ADW_Teach_Info ()
{
	B_DIA_Addon_Riordian_Teach_15_00 ();

	if ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF]	 	== FALSE)
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF]		== FALSE)
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] 	== FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] 	== FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] 	== FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] 	== FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] 	== FALSE)	
	{                                            
		Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
		Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,DIALOG_BACK,DIA_Addon_Riordian_ADW_Teach_BACK);
		B_DIA_Addon_Riordian_Teach_10_01 ();
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_FF, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_FF)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FF);
		};
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_NONE, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_NONE)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_NONE);
		};	
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE)
		&& (WISPSKILL_LEVEL >= 2)
		{
			Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_RUNE, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_RUNE)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_RUNE);
		};
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE)
		&& (WISPSKILL_LEVEL >= 2)
		{
			Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_MAGIC, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_MAGIC)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_MAGIC);
		};
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE)
		&& (WISPSKILL_LEVEL >= 3)
		{
			Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_FOOD, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_FOOD)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FOOD);
		};
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE)
		&& (WISPSKILL_LEVEL >= 3)
		{
			Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_POTIONS, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_POTIONS)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_POTIONS);
		};
	}
	else 
	{
		B_DIA_Addon_Riordian_Teach_10_08 ();
		DIA_Addon_Riordian_ADW_Teach_NoPerm = TRUE;
	};
};
func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ()
{
	B_DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00 ();
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_BACK ()
{
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FF ()
{
	if B_TeachPlayerTalentWispDetector  (self, other, WISPSKILL_FF)
	{
		if (WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ();
	};
	
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_WISPSKILL_NONE ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_NONE)
	{
		if (WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ();
	};
	
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_WISPSKILL_RUNE ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_RUNE)
	{
		if (WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ();
	};
	
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_WISPSKILL_MAGIC ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_MAGIC)
	{
		if (WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ();
	};
	
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FOOD ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_FOOD)
	{
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ();
	};
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_WISPSKILL_POTIONS ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_POTIONS)
	{
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ();
	};
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};


///////////////////////////////////////////////////////////////////////
//	Info TeachAlchemy
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Riordian_ADW_TeachAlchemy   (C_INFO)
{
	npc         = KDW_14040_Addon_Riordian_ADW;
	nr          = 2;
	condition   = DIA_Riordian_ADW_TeachAlchemy_Condition;
	information = DIA_Riordian_ADW_TeachAlchemy_Info;
	permanent   = TRUE;
	description = "Enseignez-moi l'art de brasser des potions.";
};
//----------------------------------------
var int DIA_Riordian_ADW_TeachAlchemy_permanent;
//----------------------------------------

FUNC INT DIA_Riordian_ADW_TeachAlchemy_Condition()
{	
	if (DIA_Riordian_ADW_TeachAlchemy_permanent == FALSE)
	&& (Riordian_ADW_ADDON_TeachAlchemy == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Info()
{
	var int talente;
	talente = 0;
	AI_Output (other, self,"DIA_Addon_Riordian_ADW_TeachAlchemy_15_00");//Enseignez-moi l'art de brasser des potions.

	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	{
		Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,DIALOG_BACK,DIA_Riordian_ADW_TeachAlchemy_BACK);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Essence m�dicinale", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)),DIA_Riordian_ADW_TeachAlchemy_Health_01);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Extrait m�dicinal", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)),DIA_Riordian_ADW_TeachAlchemy_Health_02);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Essence de mana", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)),DIA_Riordian_ADW_TeachAlchemy_Mana_01);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Extrait de mana", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)),DIA_Riordian_ADW_TeachAlchemy_Mana_02);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Elixir de mana", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_03)),DIA_Riordian_ADW_TeachAlchemy_Mana_03);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Elixir de l'esprit", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)),DIA_Riordian_ADW_TeachAlchemy_Perm_Mana);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Elixir de dext�rit�", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)),DIA_Riordian_ADW_TeachAlchemy_Perm_DEX);
		talente = (talente + 1);
	};

	if (talente > 0)
	{
		if (Alchemy_Explain != TRUE)
		{
			AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_01"); //Le brassage des potions magiques n�cessite un laboratoire d'alchimie. Nous en avons un ici, dans notre demeure.
			AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_02"); //Vous aurez besoin d'une fiole de laboratoire vide, des ingr�dients n�cessaires et d'une bonne connaissance de la recette de la potion.
			AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_03"); //Je puis vous dispenser ces connaissances. Le reste, vous allez devoir le d�couvrir par vous-m�me.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_04"); //Que voulez-vous brasser ?
		};
	}
	else 
	{
		AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_05"); //Je ne puis rien vous apprendre que vous ne sachiez pas d�j�.
		DIA_Riordian_ADW_TeachAlchemy_permanent = TRUE;
	};
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_BACK ()
{
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Health_01 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};
FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Health_02 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Mana_01 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Mana_02 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Mana_03 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_03);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Perm_Mana ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Mana);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Perm_Dex ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_DEX);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};





