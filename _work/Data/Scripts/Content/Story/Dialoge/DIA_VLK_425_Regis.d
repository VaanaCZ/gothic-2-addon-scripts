///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Regis_EXIT   (C_INFO)
{
	npc         = VLK_425_Regis;
	nr          = 999;
	condition   = DIA_Regis_EXIT_Condition;
	information = DIA_Regis_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Regis_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Regis_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Regis_PICKPOCKET (C_INFO)
{
	npc			= VLK_425_Regis;
	nr			= 900;
	condition	= DIA_Regis_PICKPOCKET_Condition;
	information	= DIA_Regis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Regis_PICKPOCKET_Condition()
{
	C_Beklauen (40, 35);
};
 
FUNC VOID DIA_Regis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Regis_PICKPOCKET);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_BACK 		,DIA_Regis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Regis_PICKPOCKET_DoIt);
};

func void DIA_Regis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
	
func void DIA_Regis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Hallo		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	1;
	condition	 = 	DIA_Regis_Hallo_Condition;
	information	 = 	DIA_Regis_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Regis_Hallo_Condition ()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Regis_Hallo_Info ()
{	
	AI_Output			(self, other, "DIA_Regis_Hallo_13_00"); //Hej, tys v tomhle m�st� nov�, co?
	AI_Output			(other, self, "DIA_Regis_Hallo_15_01"); //Ano, a co ty?
	AI_Output			(self, other, "DIA_Regis_Hallo_13_02"); //P�i�el jsem z pevniny a te� se tu jen tak poflakuju. U� mi skoro do�ly pen�ze, tak�e mi nejsp� nezbude nic jin�ho ne� se p�idat k domobran�.
	AI_Output			(self, other, "DIA_Regis_Hallo_13_03"); //Ale j� tam nechci. Nem�n�m se nechat ve jm�nu kr�le zab�t n�jak�mi �pinav�mi sk�ety.
};
///////////////////////////////////////////////////////////////////////
//	Info MILIZ
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_MILIZ		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_MILIZ_Condition;
	information	 = 	DIA_Regis_MILIZ_Info;
	permanent    =  FALSE;
	description	 = 	"Co bys mi �ekl o domobran�?";
};
func int DIA_Regis_MILIZ_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_Hallo) 
	{
		return TRUE;
	};
};
func void DIA_Regis_MILIZ_Info ()
{
	AI_Output (other, self, "DIA_Regis_MILIZ_15_00"); //Co bys mi �ekl o domobran�?
	AI_Output (self, other, "DIA_Regis_Add_13_01"); //Vede ji jeden z paladin�, jist� lord Andre.
	AI_Output (self, other, "DIA_Regis_Add_13_02"); //Pokou�� se zmobilizovat p�lku m�sta pro p��pad, �e by n�s napadli sk�eti.
	AI_Output (self, other, "DIA_Regis_Add_13_03"); //Ale chce�-li se nechat najmout, mus� se nap�ed st�t ob�anem m�sta.
	AI_Output (self, other, "DIA_Regis_Add_13_04"); //Pokud v�m, tak ty nejsi zdej��m ob�anem, tak�e i kdy� bude� cvi�it sebev�c, stejn� t� ofici�ln� nep�ijmou.
};
///////////////////////////////////////////////////////////////////////
//	Info ANDRE
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_ANDRE		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ANDRE_Condition;
	information	 = 	DIA_Regis_ANDRE_Info;
	permanent    =  FALSE;
	description	 = 	"Co dal��ho mi je�t� m��e� prozradit o lordu Andrem?";
};
func int DIA_Regis_ANDRE_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_MILIZ) 
	{
		return TRUE;
	};
};
func void DIA_Regis_ANDRE_Info ()
{
	AI_Output (other, self, "DIA_Regis_ANDRE_15_00"); //Co dal��ho mi je�t� m��e� prozradit o lordu Andrem?
	AI_Output (self, other, "DIA_Regis_Add_13_05"); //Tak� tu zast�v� funkci soudce.
	AI_Output (self, other, "DIA_Regis_Add_13_06"); //Pokud ve m�st� n�co provede�, bude� se zodpov�dat jemu.
	AI_Output (self, other, "DIA_Regis_Add_13_07"); //Jednou jsem se takhle s n�k�m popral.
	AI_Output (self, other, "DIA_Regis_Add_13_08"); //On si pak �el st�ovat lordu Andremu a udal m�.
	AI_Output (self, other, "DIA_Regis_Add_13_09"); //Cel� ta z�le�itost m� p�i�la na 50 zla��k�.
	AI_Output (self, other, "DIA_Regis_Add_13_10"); //A to jsem m�l kliku, �e se to stalo v noci, a tak u toho nebyli ��dn� sv�dkov�.
	AI_Output (self, other, "DIA_Regis_Add_13_11"); //��m v�c lid� si na tebe toti� st�uje, t�m vy��� pokutu pak mus� zaplatit.
};

// ****************************************************
// 					Pr�gelei mit Valentino
// ****************************************************
instance DIA_Regis_Valentino (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_Valentino_Condition;
	information	 = 	DIA_Regis_Valentino_Info;
	permanent    =  FALSE;
	description	 = 	"S k�m jsi bojoval?";
};
func int DIA_Regis_Valentino_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_ANDRE) 
	{
		return TRUE;
	};
};
func void DIA_Regis_Valentino_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_12"); //S k�m jsi bojoval?
	AI_Output (self, other, "DIA_Regis_Add_13_13"); //S chl�pkem jm�nem Valentino - �asto se poflakuje kolem putyky pobl� chr�mu.
	AI_Output (self, other, "DIA_Regis_Add_13_14"); //J� tedy nejsem ��dn� n�siln�k, ale TENHLE man�k si zaslou��, aby mu n�kdo po��dn� zmaloval cifern�k.
};

// ****************************************************
// 					Valentino DEFEATED
// ****************************************************
instance DIA_Regis_ValDefeat (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ValDefeat_Condition;
	information	 = 	DIA_Regis_ValDefeat_Info;
	permanent    =  FALSE;
	description	 = 	"Setkal jsem se s Valentinem...";
};
func int DIA_Regis_ValDefeat_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Regis_Valentino))
	&& (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_ValDefeat_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_15"); //Setkal jsem se s Valentinem...
	AI_Output (self, other, "DIA_Regis_Add_13_16"); //A?
	AI_Output (other, self, "DIA_Regis_Add_15_17"); //Dal jsem mu p�r facek.
	AI_Output (self, other, "DIA_Regis_Add_13_18"); //(sm�je se) Zaslou�il si to.
	if (!Npc_IsDead (Valentino))
	{
		AI_Output (self, other, "DIA_Regis_Add_13_19"); //Tum� - tenhle prsten jsem od n�j z�skal, kdy� se n� mal� spor urovnal.
		B_GiveInvItems (self, other, ItRi_ValentinosRing, 1);
		Regis_Ring = TRUE;
		AI_Output (self, other, "DIA_Regis_Add_13_20"); //(k�en� se) M��e� ho pak v�novat prvn�mu, kdo mu d� p�r p�es hubu.
	};
};

// **************************************************************
// 							PERM
// **************************************************************
//--------------------------
	var int Regis_Bogendieb;
//--------------------------
instance DIA_Regis_PERM		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr 			 =  200;
	condition	 = 	DIA_Regis_PERM_Condition;
	information	 = 	DIA_Regis_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"Stalo se tu n�co zaj�mav�ho?";
};
func int DIA_Regis_PERM_Condition ()
{
	return TRUE;
};
func void DIA_Regis_PERM_Info ()
{
	AI_Output (other, self, "DIA_Regis_PERM_15_00"); //Stalo se tu n�co zaj�mav�ho?
	
	if (Regis_Bogendieb == FALSE)
	&& (MIS_Bosper_Bogen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_01"); //Dalo by se to tak ��ct.
		AI_Output (self, other, "DIA_Regis_PERM_13_02"); //Okradli v�robce luk� Bospera - takovou drzost aby pohledal!
		AI_Output (self, other, "DIA_Regis_PERM_13_03"); //Ten man�k prost� za b�l�ho dne ve�el do kr�mu a rychle �majznul jeden z luk�.
		AI_Output (self, other, "DIA_Regis_PERM_13_04"); //A Bosper hned za n�m a hul�kal: "St�j, ty zlod�ji!" Ale lupi� byl rychlej��.
		
		
		MIS_Bosper_Bogen = LOG_RUNNING;
		Regis_Bogendieb = TRUE;
	}
	else if (MIS_Bosper_Bogen == LOG_SUCCESS)
		 && (Regis_Bogendieb != 2)	
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_05"); //N�jak� poctiv� n�lezce vr�til ukraden� luk zp�tky Bosperovi.
		AI_Output (self, other, "DIA_Regis_PERM_13_06"); //To je divn� - �lov�k by si myslel, �e se dnes ka�d� star� jen s�m o sebe, ale tenhle chlap byl jin� a luk vr�til.
		Regis_Bogendieb = 2;
	}
	else
	{
		if (Kapitel != 3)
		{
			AI_Output (self, other, "DIA_Regis_PERM_13_07"); //No, v�echno je v klidu. Po��t�m, �e a� sem p�it�hnou sk�eti, ur�it� si jich v�imneme.
		}
		else 
		{
			if (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_08"); //Nakonec zjistili, �e ten �old�k je nevinn�, a museli ho pustit.
				AI_Output (self, other, "DIA_Regis_PERM_13_09"); //Lord Hagen mus� b�t vzteky bez sebe.
			}
			else
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_10"); //Je toho pln� m�sto. Pamatuje� se na paladina Lothara?
				AI_Output (other,self , "DIA_Regis_PERM_15_11"); //Mo�n�.
				AI_Output (self, other, "DIA_Regis_PERM_13_12"); //Tak ten je mrtv�. Zabili ho p��mo na ulici a samoz�ejm� z toho obvinili �old�ky, jak jinak.
			};
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Crew
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Crew		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	51;
	condition	 = 	DIA_Regis_Crew_Condition;
	information	 = 	DIA_Regis_Crew_Info;
	permanent    =  FALSE;
	description	 = 	"Pokou��m se naj�t pos�dku na cestu po mo�i.";
};
func int DIA_Regis_Crew_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_Crew_Info ()
{
	AI_Output			(other, self, "DIA_Regis_Crew_15_00"); //Pokou��m se naj�t pos�dku na cestu po mo�i.
	AI_Output			(self, other, "DIA_Regis_Crew_13_01"); //Tak s t�m ti nepom��u. Nejsp� by ses m�l porozhl�dnout po p��stavu nebo se poptat n�kde v hospod�.
	AI_Output			(self, other, "DIA_Regis_Crew_13_02"); //Jestli tu z�stali je�t� n�jac� n�mo�n�ci, ur�it� je najde� tam.

};


