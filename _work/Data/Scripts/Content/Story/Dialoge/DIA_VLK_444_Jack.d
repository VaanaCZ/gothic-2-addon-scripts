///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jack_EXIT   (C_INFO)
{
	npc         = VLK_444_Jack;
	nr          = 999;
	condition   = DIA_Jack_EXIT_Condition;
	information = DIA_Jack_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Jack_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jack_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jack_PICKPOCKET (C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 900;
	condition	= DIA_Jack_PICKPOCKET_Condition;
	information	= DIA_Jack_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jack_PICKPOCKET_Condition()
{
	C_Beklauen (50, 100);
};
 
FUNC VOID DIA_Jack_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jack_PICKPOCKET);
	Info_AddChoice		(DIA_Jack_PICKPOCKET, DIALOG_BACK 		,DIA_Jack_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jack_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jack_PICKPOCKET_DoIt);
};

func void DIA_Jack_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jack_PICKPOCKET);
};
	
func void DIA_Jack_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jack_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_GREET		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	4;
	condition	 = 	DIA_Jack_GREET_Condition;
	information	 = 	DIA_Jack_GREET_Info;
	important 	 =  TRUE; 

};

func int DIA_Jack_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Jack_GREET_Info ()
{
	AI_Output			(self ,other, "DIA_Jack_GREET_14_00"); //H� ho ! Vous avez �chou� ici, marin d'eau douce�?
	AI_Output			(self ,other, "DIA_Jack_GREET_14_01"); //Je vous trouve un peu p�lot...
	AI_Output			(self ,other, "DIA_Jack_GREET_14_02"); //Mais ce n'est pas grave, moussaillon. L'air du large vous fera du bien.
};


///////////////////////////////////////////////////////////////////////
//	Was machst Du hier
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_Job		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	5;
	condition	 = 	DIA_Jack_Job_Condition;
	information	 = 	DIA_Jack_Job_Info;

	description	 = 	"Que faites-vous ici ?";
};

func int DIA_Jack_Job_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_GREET)
	{
		return TRUE;
	};
};
func void DIA_Jack_Job_Info ()
{
	AI_Output			(other, self, "DIA_Jack_Job_15_00"); //Que faites-vous ici ?
	//AI_Output			(self, other, "DIA_Jack_Job_14_01"); //Damals, als junger Mann, bin ich noch zur See gefahren und habe so manchen gro�en Sturm miterlebt.
	//AI_Output			(self, other, "DIA_Jack_Job_14_02"); //Vor vielen Jahren hab ich mich dann hier nieder gelassen und war lange Zeit Leuchtturmw�rter von Khorinis.
	//AI_Output			(self, other, "DIA_Jack_Job_14_03"); //Keine aufregende Sache. Wirklich nicht. Aber dieser alte Turm kam dem, was man ein Zuhause nennt, am N�chsten.
	//AI_Output			(self, other, "DIA_Jack_Job_14_04"); //Bin schon ziemlich lange nicht mehr oben gewesen.
	//AI_Output			(other, self, "DIA_Jack_Job_15_05"); //Warum nicht?
	AI_Output			(self ,other, "DIA_Jack_Job_14_06"); //Je n'ose plus approcher de mon phare depuis que ces salauds s'en sont empar�s. Ce sont vraiment des f�roces, ceux-l�.
	AI_Output			(self ,other, "DIA_Jack_Job_14_07"); //Il s'agit de criminels �chapp�s de la Vall�e des mines vous savez...
	AI_Output			(self ,other, "DIA_Jack_Job_14_08"); //Il y a eu une terrible explosion de l'autre c�t� des montagnes et ils se sont abattus sur la r�gion comme une nu�e de sauterelles. Et maintenant, ils se cachent partout... jusque dans mon phare�!
	AI_Output			(self ,other, "DIA_Jack_Job_14_09"); //A mon avis, ils cherchent un bateau � attaquer.
	AI_Output			(self ,other, "DIA_Jack_Job_14_10"); //Ha�! Qu'ils le fassent, tiens�! Comme �a, au moins, ils d�guerpiront de mon phare.
	
	Log_CreateTopic (TOPIC_KillLighthouseBandits, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillLighthouseBandits, LOG_RUNNING);
	B_LogEntry (TOPIC_KillLighthouseBandits,"Jack, le vieux loup de mer, ne peut retourner dans son phare tant que des bandits s'y trouvent."); 
	
	MIS_Jack_KillLighthouseBandits = LOG_RUNNING;
	
};

///////////////////////////////////////////////////////////////////////
//	Erz�hl mir was �ber die Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_City		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	6;
	condition	 = 	DIA_Jack_City_Condition;
	information	 = 	DIA_Jack_City_Info;

	description	 = 	"Venez-vous souvent en ville ?";
};

func int DIA_Jack_City_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_Job)
	{
		return TRUE;
	};
};
func void DIA_Jack_City_Info ()
{
	AI_Output			(other, self, "DIA_Jack_City_15_00"); //Vous venez souvent en ville�?
	AI_Output			(self ,other, "DIA_Jack_City_14_01"); //Comme je dis toujours, on peut juger une ville � son port.
	AI_Output			(self ,other, "DIA_Jack_City_14_02"); //Le port, c'est la porte ouverte vers le monde. C'est l� que tout le monde se rencontre et que tout commence.
	AI_Output			(self ,other, "DIA_Jack_City_14_03"); //Quand le port se met � partir � vau-l'eau, vous pouvez vous attendre � ce que le reste de la ville suive dans les plus brefs d�lais.
};

///////////////////////////////////////////////////////////////////////
//	Erz�hl mir was �ber den Hafen
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_Harbor		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	70;
	condition	 = 	DIA_Jack_Harbor_Condition;
	information	 = 	DIA_Jack_Harbor_Info;
	permanent	 =  TRUE;

	description	 = 	"Parlez-moi du port.";
};

func int DIA_Jack_Harbor_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_City)
		&&	((Npc_GetDistToWP(self,"LIGHTHOUSE")< 3000) == FALSE)
		&& 	(JackIsCaptain == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jack_Harbor_Info ()
{
	AI_Output			(other, self, "DIA_Jack_Harbor_15_00"); //Parlez-moi du port.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_01"); //Le port de Khorinis n'est plus ce qu'il �tait.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_02"); //On n'y trouve plus que de la racaille, plus aucun bateau n'y vient et le commerce est mort. Bel exemple de naufrage, si vous voulez mon avis...
	
	Info_ClearChoices (DIA_Jack_Harbor);
	Info_AddChoice (DIA_Jack_Harbor,DIALOG_BACK,DIA_Jack_Harbor_Back);
	Info_AddChoice (DIA_Jack_Harbor,"Pourquoi les bateaux ne viennent-ils plus ?",DIA_Jack_Harbor_Ships);
	Info_AddChoice (DIA_Jack_Harbor,"Qu'entendez-vous par racaille ?",DIA_Jack_Harbor_Rogue);
	Info_AddChoice (DIA_Jack_Harbor,"Alors pourquoi ne partez-vous pas ?",DIA_Jack_Harbor_Leave);
};

FUNC VOID DIA_Jack_Harbor_Back ()
{
	Info_ClearChoices (DIA_Jack_Harbor);
};

FUNC VOID DIA_Jack_Harbor_Ships ()
{	
	AI_Output (other,self ,"DIA_Jack_Harbor_Ships_15_00"); //Pourquoi les bateaux n'arrivent-ils plus�?
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_01"); //Tout le monde dit que la situation redeviendra normale quand la guerre sera termin�e, mais c'est des foutaises si vous voulez mon avis.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_02"); //Je vous le dis, moi, un marin voit bien quand une ville part � vau-l'eau.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_03"); //Un matelot le sent dans ses veines. Et je vous le r�p�te, vous pouvez oublier ce port�: sa grande �poque est pass�e.
};

FUNC VOID DIA_Jack_Harbor_Rogue ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Rogue_15_00"); //Que voulez-vous dire par racaille�?
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_01"); //Regardez-moi tous ces bons � rien. La plupart d'entre eux ne savent m�me pas ce qu'est le travail. Ils passent leurs journ�es � boire et d�pensent le peu d'argent qu'ils ont � la maison de passe.
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_02"); //Je vous le dis, restez au large.
};

FUNC VOID DIA_Jack_Harbor_Leave ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_00"); //Pourquoi ne partez-vous pas, dans ces conditions�?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_01"); //De nos jours, personne ne veut d'un vieux loup de mer tel que moi sur son bateau.
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_02"); //La plupart des gens pensent que le vieux Jack souffre de la goutte.
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_03"); //Et�? C'est vrai�?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_04"); //Foutaises, oui�! Mettez-moi un pont de bateau sous les pieds et je retrouve l'�nergie de mes vingt ans�!
};

///////////////////////////////////////////////////////////////////////
//	Info BanditenWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BANDITENWEG		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	7;
	condition	 = 	DIA_Jack_BANDITENWEG_Condition;
	information	 = 	DIA_Jack_BANDITENWEG_Info;

	description	 = 	"Les bandits qui occupaient votre phare sont partis.";
};

func int DIA_Jack_BANDITENWEG_Condition ()
{
	if (Npc_IsDead(LeuchtturmBandit_1021))
		&& (Npc_IsDead(LeuchtturmBandit_1022))
		&& (Npc_IsDead(LeuchtturmBandit_1023))
		&& (MIS_Jack_KillLighthouseBandits == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Jack_BANDITENWEG_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BANDITENWEG_15_00"); //Les brigands qui s'�taient appropri�s votre phare sont partis.
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_01"); //C'est vrai�? Enfin�! Je vais pouvoir recommencer � travailler.
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_02"); //Accompagnez-moi jusqu'au phare. Vous verrez, le point de vue est saisissant l�-haut.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Lighthouse");
	MIS_Jack_KillLighthouseBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_KillLighthouseBandits);
};

///////////////////////////////////////////////////////////////////////
//	Info LighthouseFree
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_LIGHTHOUSEFREE		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	8;
	condition	 = 	DIA_Jack_LIGHTHOUSEFREE_Condition;
	information	 = 	DIA_Jack_LIGHTHOUSEFREE_Info;
	permanent	 = 	TRUE;


	description	 = 	"Vous avez un beau phare.";
};

func int DIA_Jack_LIGHTHOUSEFREE_Condition ()
{
	if (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
		&&	(Npc_GetDistToWP(self,"LIGHTHOUSE")<3000) 
		&& (MIS_SCKnowsWayToIrdorath == FALSE) 
		{
				return TRUE;
		};
};

func void DIA_Jack_LIGHTHOUSEFREE_Info ()
{
	AI_Output			(other, self, "DIA_Jack_LIGHTHOUSEFREE_15_00"); //Joli phare que vous avez l�.
	AI_Output			(self, other, "DIA_Jack_LIGHTHOUSEFREE_14_01"); //Merci. Montez jusqu'en haut et appr�ciez la vue, moussaillon. Vous �tes ici chez vous.
};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Jack_KAP3_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP3_EXIT_Condition;
	information	= DIA_Jack_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Jack_KAP4_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP4_EXIT_Condition;
	information	= DIA_Jack_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Jack_KAP5_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP5_EXIT_Condition;
	information	= DIA_Jack_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	51;
	condition	 = 	DIA_Jack_BEMYCAPTAIN_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"N'aimeriez-vous pas repartir en mer ?";
};

func int DIA_Jack_BEMYCAPTAIN_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
		&& (MIS_Jack_NewLighthouseOfficer == 0)
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_15_00"); //Vous n'aimeriez pas reprendre la mer�?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_01"); //Je donnerais mon bras droit pour faire une derni�re fois partie de l'�quipage d'un grand navire.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_02"); //Mais ce n'est pas simple pour un vieux loup de mer comme moi, moussaillon. Et qui s'occuperait du phare si je venais � partir, hein�?

	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Laissez tomber. C'�tait juste une id�e en l'air.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "J'ai besoin de votre exp�rience de navigateur.", DIA_Jack_BEMYCAPTAIN_seaman );

};

func void DIA_Jack_BEMYCAPTAIN_seaman ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_00"); //J'aurais besoin d'un marin aussi exp�riment� que vous.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_01"); //Par ma barbe�! Qu'est-ce que vous avez en t�te, moussaillon�? Vous ne comptez tout de m�me pas vous lancer � l'abordage de la gal�re du roi, si�?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_02"); //Qui peut savoir�?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_03"); //(�clate de rire) �a, ce serait quelque chose�! Mais je ne peux pas abandonner mon phare comme �a. Hmm... Que faire�?
	
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                        
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                      
	B_LogEntry (TOPIC_Captain,"Jack, le vieux loup de mer du port, ferait un bon capitaine. Mais je dois d'abord trouver quelqu'un pour le remplacer au phare."); 
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Laissez tomber. C'�tait juste une id�e en l'air.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Et si je vous amenais quelqu'un... ?", DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer );

};
func void DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00"); //Et si je vous ramenais quelqu'un qui accepterait de vous remplacer au phare en votre absence�?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01"); //Bonne id�e, moussaillon. Et je connais m�me quelqu'un qui ferait l'affaire...
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02"); //Harad le forgeron a un apprenti du nom de Brian, � qui j'ai parl� � de nombreuses reprises.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03"); //J'aimerais bien lui confier mon phare. Je crois qu'il ferait un tr�s bon gardien en mon absence.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04"); //Allez lui parler. Avec un peu de chance, il acceptera peut-�tre de nous aider.
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	MIS_Jack_NewLighthouseOfficer = LOG_RUNNING;
};


func void DIA_Jack_BEMYCAPTAIN_no ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_no_15_00"); //Laissez tomber, c'�tait juste une id�e en l'air.
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain2
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN2		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	52;
	condition	 = 	DIA_Jack_BEMYCAPTAIN2_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN2_Info;

	description	 = 	"A propos de Brian...";
};

func int DIA_Jack_BEMYCAPTAIN2_Condition ()
{
	if 	((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		|| 	((MIS_Jack_NewLighthouseOfficer == LOG_RUNNING)	&& 	(Npc_IsDead(Brian))))
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN2_Info ()
{
	if (Npc_IsDead(Brian))
	{
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_00"); //Brian est mort.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_01"); //Oh. Nous vivons vraiment une �poque affreuse. Il �tait si sympathique...
			MIS_Jack_NewLighthouseOfficer = LOG_OBSOLETE;
	}
	else
	{
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_02"); //Brian est d'accord pour garder le phare � votre place.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_03"); //J'esp�rais vous entendre dire �a.
			B_GivePlayerXP (XP_Jack_NewLighthouseOfficer);
 
		
			if (SCGotCaptain == FALSE)
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_04"); //Avez-vous encore besoin de moi�?
			}
			else
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_05"); //Voyons ce que ce gar�on sait faire...
			AI_StopProcessInfos (self);
			};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain3
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN3		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	53;
	condition	 = 	DIA_Jack_BEMYCAPTAIN3_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN3_Info;

	description	 = 	"Soyez mon capitaine.";
};

func int DIA_Jack_BEMYCAPTAIN3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jack_BEMYCAPTAIN2))
		&& (SCGotCaptain == FALSE)
		&& (MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN3_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_00"); //Je vous veux comme capitaine.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_01"); //J'ai sillonn� les sept mers, moussaillon, mais jamais en tant que capitaine d'un navire.
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_02"); //Je ne connais rien � la navigation. Il va falloir vous en charger.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_03"); //Je ferai de mon mieux.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_04"); //Montez-moi votre bateau et votre �quipage. Vous savez o� vous voulez aller au fait�? Enfin, je veux dire, vous avez une carte marine�?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_05"); //Attendez-moi au port sans vous pr�occuper du reste.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_06"); //Si vous le dites.
	AI_StopProcessInfos (self);
	SCGotCaptain = TRUE;
	JackIsCaptain = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine	(self,"WaitForShipCaptain");
	
	B_GivePlayerXP (XP_Captain_Success);        
};

///////////////////////////////////////////////////////////////////////
//	Info Losfahren
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_LOSFAHREN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	59;
	condition	 = 	DIA_Jack_LOSFAHREN_Condition;
	information	 = 	DIA_Jack_LOSFAHREN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Allez vieil homme, mettons les voiles.";
};

func int DIA_Jack_LOSFAHREN_Condition ()
{
	if (JackIsCaptain == TRUE)
		&& (MIS_ReadyforChapter6 ==	FALSE)
		{
				return TRUE;
		};
};

func void DIA_Jack_LOSFAHREN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_LOSFAHREN_15_00"); //Tout � fait, vieil homme. Levons l'ancre.

	if ((B_CaptainConditions (self)) == TRUE)
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_01"); //Tout est en ordre. Montrez-moi votre carte marine.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_02"); //Quel voyage�! J'esp�re qu'on arrivera � bon port en un seul morceau...
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_03"); //Vous avez vraiment tout ce qu'il vous faut�? On ne fera pas demi-tour pour vous si jamais vous vous apercevez que vous avez oubli� quelque chose.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_04"); //Si vous �tes bien s�r de tout avoir sur vous, allez dormir dans la cabine du capitaine. Vous en aurez bien besoin.
		AI_StopProcessInfos (self);
		B_CaptainCallsAllOnBoard (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_05"); //Du calme, moussaillon. Je n'ai pas encore vu votre rafiot. �a ne marche pas comme �a, vous savez.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_06"); //Pour commencer, il vous faut un �quipage de cinq hommes, plus l'acc�s au bateau et une carte marine. Si vous n'arrivez pas � r�unir tout �a, inutile d'y penser.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info perm5_NotCaptain
///////////////////////////////////////////////////////////////////////

instance DIA_Jack_PERM5_NOTCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	59;
	condition	 = 	DIA_Jack_PERM5_NOTCAPTAIN_Condition;
	information	 = 	DIA_Jack_PERM5_NOTCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Et que c'est-il pass� ensuite ?";
};

func int DIA_Jack_PERM5_NOTCAPTAIN_Condition ()
{
		if	((Npc_KnowsInfo(other, DIA_Jack_BEMYCAPTAIN2))
		&& 	(SCGotCaptain == TRUE)
		&&	(JackIsCaptain == FALSE))
		|| 	(MIS_Jack_NewLighthouseOfficer == LOG_OBSOLETE)
		{
				return TRUE;
		};
};

func void DIA_Jack_PERM5_NOTCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_PERM5_NOTCAPTAIN_15_00"); //Alors�? Et maintenant�?
	AI_Output			(self, other, "DIA_Jack_PERM5_NOTCAPTAIN_14_01"); //J'y ai longuement r�fl�chi. Je crois bien que je vais rester ici et que finalement je vais continuer � garder mon phare.
	
	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Jack_KAP6_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP6_EXIT_Condition;
	information	= DIA_Jack_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};










































 





















