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
	description = "Tohle je tv� bouda?";
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
	AI_Output (other,self,"DIA_Addon_Francis_GregsHut_15_00"); //Tohle je tvoje chatr�?
	AI_Output (self,other,"DIA_Addon_Francis_GregsHut_13_01"); //Ne, pat�� Gregovi.
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
	description = "Mus�m se dostat do Gregovy chatr�e.";
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
	AI_Output (other, self ,"DIA_Addon_Francis_LetMeIn_15_00"); //Mus�m se dostat do Gregovy boudy.
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_01"); //Na to zapome�!
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_02"); //Greg tu nen�. A j� zamknul dve�e, aby nikoho nesvrb�ly ruce a nemoh se tam propl�it. 
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_03"); //Vypadne� odsu� s�m, nebo ti m�m pomoct?
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
	description = "Greg je tv�j ��f?";
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
	AI_Output (other, self ,"DIA_Addon_Francis_AboutGreg_15_00"); //Greg je tv�j ��f?
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_01"); //Ne, a nesna� se mi namluvit, �e ho zn�.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_02"); //Proto�e stra�n�ho kapit�na Grega zn� ka�dej n�mo�n�k i zatracen� suchozemsk� krysa z tohohle ostrova.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_03"); //(nafoukan�) A von sv��il velen� MN�!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_04"); //Zvodpov�d�m za to, aby ta l�n� pak� d�lala, co j� poru�il.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_05"); //N�kter� chlapi si myslej, �e kdy� kapit�n vystr�il paty, m��ou si d�lat, co cht�j.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_06"); //A budou PO��DN� p�ekvapen�, a� se Greg vr�t�. 
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_07"); //P�� mu �eknu �pln� vo v�em, co se tu d�lo, kapi�to?
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_08"); //V�etn� toho, kdo se mu sna�il vl�zt do boudy.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_09"); //Tak�e odpal, jinak bude� m�t po��dn� probl�my.
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
	description = "Dej mi kl�� od Gregovy chatr�e!";
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
	AI_Output (other, self,"DIA_Addon_Francis_Key_15_00"); //Dej mi kl�� od Gregovy boudy!
	AI_Output (self ,other,"DIA_Addon_Francis_Key_13_01"); //To si snad d�l� srandu!
	
	Info_ClearChoices (DIA_Addon_Francis_Key);
	Info_AddChoice (DIA_Addon_Francis_Key, "Pop�em��l�m o tom.", DIA_Addon_Francis_Key_BACK);
	Info_AddChoice (DIA_Addon_Francis_Key, "D�m ti 2000 zla��k�!", DIA_Addon_Francis_Key_2000Gold);
	Info_AddChoice (DIA_Addon_Francis_Key, "D�m ti 1000 zla��k�!", DIA_Addon_Francis_Key_1000Gold);
};
func void DIA_Addon_Francis_Key_BACK()
{
	Info_ClearChoices (DIA_Addon_Francis_Key);
};
func void DIA_Addon_Francis_Key_1000Gold()
{
	AI_Output (other, self ,"DIA_Addon_Francis_Key_1000Gold_15_00"); //D�m ti za n�j 1000 zla��k�!
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_01"); //N�co mi ��k�, �e za takovej pakatel sv�ho kapit�na nezrad�m.
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_02"); //Bacha na zob�k, jinak t� st�hnu z k��e!
};
func void DIA_Addon_Francis_Key_2000Gold()
{
	AI_Output (other,self ,"DIA_Addon_Francis_Key_2000Gold_15_00"); //D�m ti 2000 zla��k�!
	
	if (Npc_HasItems (other,ItMI_Gold) >= 2000)
	{
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_01"); //Hochu, ty po mn� chce�, abych se vzbou�il!
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_02"); //(pro sebe) No, ale na druhou stranu...
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_03"); //No dob�e, dej to sem. Nikdo to nemus� v�d�t.
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_04"); //Tady m� kl��!
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_05"); //Ale koukej sebou hodit, ne� se Greg vr�t�. A nikomu ani slovo, jasn�?
		B_GiveInvItems (other, self,ItMi_Gold,2000);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
		Francis_bezahlt = TRUE;
	}
	else 
	{
		AI_Output (self ,other,"DIA_Addon_FrancisNotEnoughGold_13_05"); //(sm�je se) Ha! Vsad�m se, �e tolik ani nem�!
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
	description = "Tak j� se mrknu, co mi m��e� nab�dnout.";
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
	AI_Output (other, self, "DIA_Addon_Francis_AufsMaul_15_00"); //No, tak se mrknem, copak tu m�.
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_01"); //(pronikav�) Co�e? Kapit�n jsem tady j�! 
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_02"); //J� t� nau��m �ct�, ty suchozemsk� kryso!
	
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
	description = "Na�el jsem tvou skr��.";
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
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_03"); //Na�el jsem tvou skr��, tv�j poklad i tvou ��etn� knihu. Je tvoje, �e jo?
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_01"); //Ehm... tuhle knihu vid�m poprv� v �ivot�.
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_02"); //A... a i KDYBY byla moje...
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_03"); //P�eci V��N� nev���, �e by n�kdo uv��il t� TV� historce, co se op�r� jen o p�r za�loutlejch str�nek.
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_01"); //V�echny jsi ob�ral o pod�ly.
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_04"); //Ehm... po�kej chvilku...
	if (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_05"); //(podl�zav�) Cht�ls kl�� od Gregovy chajdy, vi�?
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_06"); //Tak j� ti ten kl�� od Gregovy chatr�e D�M!
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_07"); //Je tam spousta cennejch v�c�...
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_08"); //(nerv�zn�) Ale vra� mi tu kn�ku a dr� hubu, jo?
		B_GiveInvItems (other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_09"); //Jen ��dn� pitomosti!
		if (Francis_bezahlt == TRUE)
		&& (Npc_HasItems(self, itmi_gold) >= 2000)
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_10"); //Tady m� svejch 2000 zlatejch.
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_11"); //A p�id�m ti je�t� dal��ch 500.
			B_GiveInvItems (self, other, itmi_gold, 2500);
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_12"); //Tady m� 500 zlatejch!
			B_GiveInvItems (self, other, itmi_gold, 500);
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_13"); //(rychle) A te� mi to dej.
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
	description = "(Tento kl�� p�jde ukr�st snadno.)";
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
		AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_00"); //(zu�iv�) Kv�li tob� m� Greg nech� �ezat d��v� tak dlouho, dokud bude na tomdle ostrov� st�t jedinej strom!
	};
	AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_01"); //Nech m� na pokoji!
	AI_StopProcessInfos (self);
};


