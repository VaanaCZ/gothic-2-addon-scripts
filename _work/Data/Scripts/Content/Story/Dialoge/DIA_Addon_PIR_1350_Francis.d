// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Francis_EXIT(C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 999;
	condition	= DIA_Addon_Francis_EXIT_Condition;
	information	= DIA_Addon_Francis_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Francis_EXIT_Condition()
{
	if (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Francis_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			In Gregs H�tte rein 
// ************************************************************
// ------------------------------------------------------------
// 			  		Spieler kennt H�tte nicht
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_First (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 1;
	condition	= DIA_Addon_Francis_First_Condition;
	information	= DIA_Addon_Francis_First_Info;
	permanent	= FALSE;
	description = "C'est votre cabane ?";
};                       
FUNC INT DIA_Addon_Francis_First_Condition()
{
	if (Knows_GregsHut == FALSE)
	&& (Francis_ausgeschissen == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_First_Info()
{	
	AI_Output (other,self,"DIA_Addon_Francis_GregsHut_15_00"); //C'est votre cabane ?
	AI_Output (self,other,"DIA_Addon_Francis_GregsHut_13_01"); //Non, elle appartient � Greg.
	Knows_GregsHut = TRUE;
};
// ------------------------------------------------------------
// 			  			Ich mu� da rein!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_LetMeIn (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 2;
	condition	= DIA_Addon_Francis_LetMeIn_Condition;
	information	= DIA_Addon_Francis_LetMeIn_Info;
	permanent	= FALSE;
	description = "Je dois entrer dans la cabane de Greg.";
};                       
FUNC INT DIA_Addon_Francis_LetMeIn_Condition()
{
	if ( (Npc_KnowsInfo (other, DIA_Addon_Francis_First)) || (Knows_GregsHut == TRUE) )
	&& (Francis_ausgeschissen == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_LetMeIn_Info()
{	
	AI_Output (other, self ,"DIA_Addon_Francis_LetMeIn_15_00"); //Je dois entrer dans la cabane de Greg.
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_01"); //N'y pensez m�me pas.
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_02"); //Greg n'est pas l�. Quant � moi, j'ai verrouill� la porte, et je m'assure que personne n'y rentre pour piller ses biens. 
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_03"); //Alors d�gagez en vitesse, ou pr�parez-vous � passer un mauvais quart d'heure !
};
// ------------------------------------------------------------
// 			  			Hab Greg getroffen!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_AboutGreg (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 3;
	condition	= DIA_Addon_Francis_AboutGreg_Condition;
	information	= DIA_Addon_Francis_AboutGreg_Info;
	permanent	= FALSE;
	description = "Greg est votre chef ?";
};                       
FUNC INT DIA_Addon_Francis_AboutGreg_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Francis_ausgeschissen == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_AboutGreg_Info()
{	
	AI_Output (other, self ,"DIA_Addon_Francis_AboutGreg_15_00"); //Greg est votre patron ?
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_01"); //N'essayez pas de me dire que vous le connaissez !
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_02"); //Tous les marins connaissent le terrible cap'taine Greg, m�me les derniers culs-terreux de cette contr�e !
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_03"); //(fier) Et c'est MOI qu'il laisse aux commandes en son absence.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_04"); //J'ai la responsabilit� de mettre ces fain�ants au travail !
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_05"); //Certains gars ont tendance � croire que lorsque le capitaine s'absente, ils sont libres de faire ce que bon leur semble.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_06"); //Ils vont avoir une sacr�e surprise au retour de Greg... 
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_07"); //Je l'informerai de tout ce qu'il s'est pass� ici, bien compris ?
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_08"); //Et notamment des personnes qui ont tent� de rentrer dans sa cabane.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_09"); //Alors d�gagez d'ici en vitesse si vous ne voulez pas d'ennuis !
};
// ------------------------------------------------------------
// 		  			Gib mir Schl�ssel + Bestechung!
// ------------------------------------------------------------
var int Francis_bezahlt;

INSTANCE DIA_Addon_Francis_Key (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 4;
	condition	= DIA_Addon_Francis_Key_Condition;
	information	= DIA_Addon_Francis_Key_Info;
	permanent	= TRUE;
	description = "Donnez-moi la clef de la cabane de Greg !";
};                       
FUNC INT DIA_Addon_Francis_Key_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_Key_Info()
{	
	AI_Output (other, self,"DIA_Addon_Francis_Key_15_00"); //Donnez-moi la clef de la cabane de Greg !
	AI_Output (self ,other,"DIA_Addon_Francis_Key_13_01"); //Vous voulez rire ?!
	
	Info_ClearChoices (DIA_Addon_Francis_Key);
	Info_AddChoice (DIA_Addon_Francis_Key, "J'y r�fl�chirai...", DIA_Addon_Francis_Key_BACK);
	Info_AddChoice (DIA_Addon_Francis_Key, "Je vous donnerai 2000 pi�ces d'or.", DIA_Addon_Francis_Key_2000Gold);
	Info_AddChoice (DIA_Addon_Francis_Key, "Je vous donnerai 1000 pi�ces d'or !", DIA_Addon_Francis_Key_1000Gold);
};
func void DIA_Addon_Francis_Key_BACK()
{
	Info_ClearChoices (DIA_Addon_Francis_Key);
};
func void DIA_Addon_Francis_Key_1000Gold()
{
	AI_Output (other, self ,"DIA_Addon_Francis_Key_1000Gold_15_00"); //Je vous donnerai 1000 pi�ces d'or !
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_01"); //D�sol�, mais �a ne m'incitera pas � trahir mon capitaine.
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_02"); //Surveillez vos propos, ou j'aurai votre peau !
};
func void DIA_Addon_Francis_Key_2000Gold()
{
	AI_Output (other,self ,"DIA_Addon_Francis_Key_2000Gold_15_00"); //Je vous donnerai 2000 pi�ces d'or.
	
	if (Npc_HasItems (other,ItMI_Gold) >= 2000)
	{
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_01"); //Ce que vous me demandez est une mutinerie !
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_02"); //(pour lui-m�me) Mais apr�s tout...
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_03"); //Bon, tenez - la voici. Personne n'a � le savoir.
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_04"); //Voici la clef !
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_05"); //Mais d�p�chez-vous d'en ressortir avant que Greg ne revienne. Et pas un mot aux autres, c'est bien compris ?
		B_GiveInvItems (other, self,ItMi_Gold,2000);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
		Francis_bezahlt = TRUE;
	}
	else 
	{
		AI_Output (self ,other,"DIA_Addon_FrancisNotEnoughGold_13_05"); //(rires) Ha ! Je suis s�r que vous n'avez m�me pas autant sur vous !
	};
	Info_ClearChoices (DIA_Addon_Francis_Key);
};
// ------------------------------------------------------------
// 			  				Aufs Maul!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_AufsMaul (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 5;
	condition	= DIA_Addon_Francis_AufsMaul_Condition;
	information	= DIA_Addon_Francis_AufsMaul_Info;
	permanent	= TRUE;
	description = "Eh bien, voyons voir ce que vous avez dans le ventre.";
};                       
FUNC INT DIA_Addon_Francis_AufsMaul_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_AufsMaul_Info()
{	
	AI_Output (other, self, "DIA_Addon_Francis_AufsMaul_15_00"); //Bien, bien... alors voyons ce que vous avez ?
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_01"); //(voix per�ante) Quoi ? C'est moi le capitaine ici ! 
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_02"); //Je vous apprendrai le respect, esp�ce de cul-terreux !
	
	AI_StopProcessInfos (self);
	B_Attack(self, other, AR_NONE, 1);
};
// ------------------------------------------------------------
// 			  		Ich habe dein Versteck gefunden...
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_Buch (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 5;
	condition	= DIA_Addon_Francis_Buch_Condition;
	information	= DIA_Addon_Francis_Buch_Info;
	permanent	= TRUE;
	description = "J'ai trouv� votre cachette...";
};                       
FUNC INT DIA_Addon_Francis_Buch_Condition()
{
	if (Npc_HasItems (other, ITWR_Addon_FrancisAbrechnung_Mis))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_Buch_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_03"); //J'ai trouv� votre cache. Votre tr�sor et votre livre des payes. C'est bien votre livre, pas vrai ?
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_01"); //Heu... Je n'ai jamais vu ce livre !
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_02"); //Et... heu, de toutes fa�ons, m�me si c'�tait mon livre...
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_03"); //Vous ne pensez tout de m�me pas que mes gars vont vous croire parce que vous leur montrez quelques pages jaunies, hein ?
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_01"); //Vous avez vol� une part de leur butin � chacun d'eux.
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_04"); //Heu... attendez un peu...
	if (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_05"); //(mielleux) Vous vouliez la clef de la cabane de Greg, pas vrai ?
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_06"); //Je vous donnerai la clef de la cabane de Greg !
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_07"); //Il y conserve tout un tas d'objets pr�cieux !
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_08"); //(nerveusement) Mais vous me donnez le livre et vous oubliez cette histoire, compris ?
		B_GiveInvItems (other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_09"); //N'allez pas faire quelque chose de stupide, c'est compris ?
		if (Francis_bezahlt == TRUE)
		&& (Npc_HasItems(self, itmi_gold) >= 2000)
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_10"); //Voici vos 2000 pi�ces d'or !
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_11"); //Auxquelles je rajoute encore 500 pi�ces.
			B_GiveInvItems (self, other, itmi_gold, 2500);
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_12"); //Et voici 500 pi�ces d'or !
			B_GiveInvItems (self, other, itmi_gold, 500);
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_13"); //(h�tivement) Et maintenant, donnez-moi cela...
		B_GiveInvItems (other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
	};
	AI_StopProcessInfos (self);
};

// ------------------------------------------------------------
// 			  				PICK POCKET
// ------------------------------------------------------------
instance DIA_Francis_PICKPOCKET (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 900;
	condition	= DIA_Francis_PICKPOCKET_Condition;
	information	= DIA_Francis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ce serait facile de lui voler la clef)";
};                       
func INT DIA_Francis_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff))
	{
		return TRUE;
	};
};
func VOID DIA_Francis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Francis_PICKPOCKET);
	Info_AddChoice		(DIA_Francis_PICKPOCKET, DIALOG_BACK 		,DIA_Francis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Francis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Francis_PICKPOCKET_DoIt);
};
func void DIA_Francis_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems (self,other , ITKE_Greg_ADDON_MIS, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Francis_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //AR_Theft f�hrt zu NEWS!
	};
	Info_ClearChoices (DIA_Francis_PICKPOCKET);
};
func void DIA_Francis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Francis_PICKPOCKET);
};


// ************************************************************
// 			  		Wenn von Greg weggeschickt 
// ************************************************************
instance DIA_Francis_Ausgeschissen (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 900;
	condition	= DIA_Francis_Ausgeschissen_Condition;
	information	= DIA_Francis_Ausgeschissen_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       
func INT DIA_Francis_Ausgeschissen_Condition()
{
	if (Francis_ausgeschissen == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
func VOID DIA_Francis_Ausgeschissen_Info()
{	
	if (!Npc_IsDead(Greg))
	{
		AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_00"); //(furieux) Gr�ce � vous, Greg m'a ordonn� de d�biter des planches jusqu'� ce qu'il n'y ait plus un arbre debout sur l'�le !
	};
	AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_01"); //Fichez-moi la paix !
	AI_StopProcessInfos (self);
};


