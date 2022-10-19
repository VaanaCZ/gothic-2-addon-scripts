// ************************************************************
// 								EXIT
// ************************************************************
INSTANCE DIA_Pepe_EXIT   (C_INFO)
{
	npc         = BAU_912_Pepe;
	nr          = 999;
	condition   = DIA_Pepe_EXIT_Condition;
	information = DIA_Pepe_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pepe_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pepe_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 								Hallo
// ************************************************************
instance DIA_Pepe_Hallo (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 1;
	condition	= DIA_Pepe_Hallo_Condition;
	information	= DIA_Pepe_Hallo_Info;
	permanent	= FALSE;
	description	= "Co tady d�l�?";
};
func int DIA_Pepe_Hallo_Condition ()
{
	return TRUE;
};
func void DIA_Pepe_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Hallo_15_00"); //Co tady d�l�?
	AI_Output (self, other, "DIA_Pepe_Hallo_03_01"); //(otr�ven�) Hl�d�m ovce! (vzdych�) A pokud je to mo�n�, vyh�b�m se probl�m�m.
	
	if ((hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))
	{
		AI_Output (other, self, "DIA_Pepe_Hallo_15_02"); //Moc to nefunguje, co?
		AI_Output (self, other, "DIA_Pepe_Hallo_03_03"); //Pff, zvl᚝ s t�mi �old�ky. Jsem opravdu r�d, �e m��u b�t tady na pastvin�. I kdy� to m��e b�t nebezpe�n� tak jako tak.
	};
};

// ************************************************************
// 								Danger
// ************************************************************
instance DIA_Pepe_Danger (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 2;
	condition	= DIA_Pepe_Danger_Condition;
	information	= DIA_Pepe_Danger_Info;
	permanent 	= FALSE;
	description	= "Co je na pastvin� tak nebezpe�n�ho?";
};
func int DIA_Pepe_Danger_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};
func void DIA_Pepe_Danger_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Danger_15_00"); //Co je tak nebezpe�n�ho na pastvin�?
	AI_Output (self, other, "DIA_Pepe_Danger_03_01"); //Po okol� se tu potuluje sme�ka vlk�. Posledn� dobou sem ty zatracen� bestie p�ich�zej se�rat n�kterou z mejch ovc� skoro ka�dej den.
	AI_Output (self, other, "DIA_Pepe_Danger_03_02"); //Je�t� p�ed p�r dny jsem m�l dvakr�t tolik ovc�. Nechci ani pomyslet na to, co se mnou Onar ud�l�, a� na to p�ijde.
};

// ************************************************************
// 								WhyNotSLD
// ************************************************************
instance DIA_Pepe_WhyNotSLD	(C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 3;
	condition	= DIA_Pepe_WhyNotSLD_Condition;
	information	= DIA_Pepe_WhyNotSLD_Info;
	PERMANENT 	= FALSE;
	description	= "Pro� jsi o t�ch vlc�ch ne�ekl �old�k�m? M�l jsem dojem, �e pro v�s pracuj�.";
};
func int DIA_Pepe_WhyNotSLD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Danger))
	&& ((hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
func void DIA_Pepe_WhyNotSLD_Info ()
{
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_00"); //Pro� jsi o t�ch vlc�ch ne�ekl �old�k�m? M�l jsem dojem, �e pro v�s pracuj�.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_01"); //Jo, j� vim. M�l jsem to ud�lat. Ale nestalo se, sakra.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_02"); //A te�, kdy� je tolik ovc� pry�, m�m strach o tom n�komu cokoli ��ct.
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_03"); //Ale pr�v� jsi to �ekl MN�.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_04"); //(zlostn�) U� toho taky lituju.
};

// ************************************************************
// 								KillWolves
// ************************************************************
instance DIA_Pepe_KillWolves (C_INFO)
{
	npc		 	= BAU_912_Pepe;
	nr			= 4;
	condition	= DIA_Pepe_KillWolves_Condition;
	information	= DIA_Pepe_KillWolves_Info;
	permanent 	= FALSE;
	description	= "Co kdy� ty vlky zabiju?";
};
func int DIA_Pepe_KillWolves_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Danger))
	{
		return TRUE;
	};
};
func void DIA_Pepe_KillWolves_Info ()
{
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_00"); //Co kdy� ty vlky zabiju?
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_01"); //(posm�n�) Ty? A s�m? Ha, ha. Tomu nev���m. To bych d��v uv��il tomu, �e to ud�l� m�j chlebod�rce.
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_02"); //Zapome� na to. Byl to jen n�vrh. Zajdu za chlapama a uvid�m, co tomu �eknou ONI.
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_03"); //(vyd�en�) Po�kej chvilku. Fajn, fajn! Ehm... Jsi nejv�t�� ze v�ech nejv�t��ch a klidn� zvl�dne� sto vlk� najednou. ��dn� probl�m!
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_04"); //Nej�ast�ji se skr�vaj� mezi stromy pobl� pastviny. (stranou) M�m dojem, �e jsou jen �ty�i.
	
	AI_StopProcessInfos (self);
	
	Wld_InsertNpc	(PEPES_YWolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01"); 
	Wld_InsertNpc	(PEPES_YWolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02"); 
	Wld_InsertNpc	(PEPES_YWolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03"); 
	Wld_InsertNpc	(PEPES_YWolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04"); 
	
	MIS_Pepe_KillWolves = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PepeWolves,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PepeWolves,LOG_RUNNING);
	B_LogEntry (TOPIC_PepeWolves,"Pepeho ovce ohro�uj� �ty�i vlci. M�l bych je zahnat.");
};

// ************************************************************
// 								KilledWolves
// ************************************************************
instance DIA_Pepe_KilledWolves		(C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_KilledWolves_Condition;
	information	 = 	DIA_Pepe_KilledWolves_Info;
	permanent	 = 	TRUE;
	description	 = 	"Odd�lal jsem ty vlky.";
};
func int DIA_Pepe_KilledWolves_Condition ()
{
	if  (MIS_Pepe_KillWolves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Pepe_KilledWolves_Info ()
{
	AI_Output (other, self, "DIA_Pepe_KilledWolves_15_00"); //Odd�lal jsem ty vlky.

	if (Npc_IsDead(PEPES_YWolf1))
	&& (Npc_IsDead(PEPES_YWolf2))
	&& (Npc_IsDead(PEPES_YWolf3))
	&& (Npc_IsDead(PEPES_YWolf4))
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_01"); //(u�asle) Dok�zals to! D�ky Innosovi!
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_02"); //Ale je�t� po��d nev�m, jak ��ct Onarovi, �e p�i�el o tolik ovc�.
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_03"); //(pro sebe) V�echno je to chyba toho zatracen�ho Bullca!

		MIS_Pepe_KillWolves = LOG_SUCCESS;
		B_GivePlayerXP (XP_PepeWolves);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_04"); //Ned�lej si ze m� bl�zny. Ty bestie je�t� nejsou v�echny mrtv�.
	};
};

// ************************************************************
// 					Was hast du �ber Bullco gesagt?
// ************************************************************
instance DIA_Pepe_Bullco (C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_Bullco_Condition;
	information	 = 	DIA_Pepe_Bullco_Info;
	permanent	 = 	FALSE;
	description	 = 	"Cos to ��kal o tom Bullcovi?";
};
func int DIA_Pepe_Bullco_Condition ()
{
	if (MIS_Pepe_KillWolves == LOG_SUCCESS)
	&& (!Npc_IsDead(Bullco))
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};
func void DIA_Pepe_Bullco_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Bullco_15_00"); //Cos to ��kal o tom Bullcovi?
	AI_Output (self, other, "DIA_Pepe_Bullco_03_01"); //Je to jeden ze �old�k�. Je to vlastn� jeho pr�ce, hl�dat pastviny.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_02"); //Ale m�sto toho se se sv�m k�mo�em Sylviem jen cel� dny poflakujou kolem Thekly v kuchyni.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_03"); //Je to chyba t�ch bastard�, �e kv�li t�m ovc�m nedostanu tejdenn� mzdu.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_04"); //Kdybych mu alespo� mohl za to d�t do zub�. Ale proti n�mu nikdo nem� ��dnou �anci. Ten chlap je zabij�k.

	MIS_Pepe_KickBullco = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_KickBullco,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_KickBullco,LOG_RUNNING);
	B_LogEntry (TOPIC_KickBullco,"Bullco se m�l o Pepeho ovce l�p starat. Pepe te� chce n�komu d�t po��dn� za vyu�enou.");
};

// ************************************************************
// 						Bullco geschlagen
// ************************************************************
instance DIA_Pepe_BullcoDefeated (C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_BullcoDefeated_Condition;
	information	 = 	DIA_Pepe_BullcoDefeated_Info;
	permanent	 = 	FALSE;
	description	 = 	"Bullco dostal, co si zaslou�il.";
};
func int DIA_Pepe_BullcoDefeated_Condition ()
{
	if (MIS_Pepe_KickBullco == LOG_RUNNING)
	{
		if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
		|| (DJG_Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			return TRUE;
		};
	};
};
func void DIA_Pepe_BullcoDefeated_Info ()
{
	AI_Output (other, self, "DIA_Pepe_BullcoDefeated_15_00"); //Bullco dostal, co si zaslou�il. Postaral jsem se o to.
	AI_Output (self, other, "DIA_Pepe_BullcoDefeated_03_01"); //Ta svin� si to zaslou�ila.

	MIS_Pepe_KickBullco = LOG_SUCCESS;
	B_GivePlayerXP (XP_KickBullco);
};

// ************************************************************
// 			  					PERM 
// ************************************************************
instance DIA_Pepe_PERM		(C_INFO)
{
	npc		 	= BAU_912_Pepe;
	nr		 	= 6;
	condition	= DIA_Pepe_PERM_Condition;
	information	= DIA_Pepe_PERM_Info;
	permanent	= TRUE;
	description	= "Jak se m�? A co tvoje ovce?";
};

func int DIA_Pepe_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Pepe_PERM_Info ()
{
	AI_Output (other, self, "DIA_Pepe_PERM_15_00"); //Jak se m�? A co tvoje ovce?

	if (kapitel <= 1)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_01"); //V pohod�. A stejn� tak ovce. Ty, co tu po��d je�t� jsou, se maj� dob�e.
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_02"); //Fajn. Ale ty vlci se jednou vr�t�j. A asi jich bude je�t� v�c!
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_03"); //Sly�el jsem hodn� divn� v�ci. N�jak� hroziv� vypadaj�c� postavy otravuj� u Sekoba. Obkl��ily jeho d�m.
	}
	
	if (kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_04"); //Sly�el jsem, �e se na Lobartov� farm� rozvaluj� n�jac� �old�ci. N�kdo by jim mo�n� m�l pomoct.
	};
};

// ************************************************************
// 			  					Liesel 
// ************************************************************
instance DIA_Pepe_Liesel		(C_INFO)
{
	npc			 = 	BAU_912_Pepe;
	nr			 = 	7;
	condition	 = 	DIA_Pepe_Liesel_Condition;
	information	 = 	DIA_Pepe_Liesel_Info;
	permanent	 = 	FALSE;
	description	 = 	"M��u si koupit ovci?";
};
func int DIA_Pepe_Liesel_Condition ()
{
	if Npc_KnowsInfo (hero, DIA_Pepe_Hallo)
	{
		return TRUE;
	};
};
func void DIA_Pepe_Liesel_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Liesel_15_00"); //M��u si koupit ovci?
	AI_Output (self, other, "DIA_Pepe_Liesel_03_01"); //Kdykoli, kdy� za ni d� dost pen�z. Jedna ovce stoj� 100 zlat�ch.
	AI_Output (self, other, "DIA_Pepe_Liesel_03_02"); //Kdy� zaplat�, m��e� si ovci vz�t. Ale mus� se o ni dob�e postarat.
};

// ************************************************************
// 			  				Buy Liesel
// ************************************************************
var int Pepe_SchafGekauft;

instance DIA_Pepe_BuyLiesel	(C_INFO)
{
	npc			 = 	BAU_912_Pepe;
	nr			 = 	8;
	condition	 = 	DIA_Pepe_BuyLiesel_Condition;
	information	 = 	DIA_Pepe_BuyLiesel_Info;
	permanent	 = 	TRUE;
	description	 = 	"Tady je 100 zlat�ch. Tak mi dej ovci.";
};
func int DIA_Pepe_BuyLiesel_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Pepe_LIESEL))
	{
		return TRUE;
	};
};
func void DIA_Pepe_BuyLiesel_Info ()
{
	AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_00"); //Tady je 100 zlat�ch. Tak mi dej ovci.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 100))
	{
		if (Pepe_SchafGekauft == 0)
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_01"); //Fajn. Tak si vezmi Betsy - najde� ji na pastvin�.
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_02"); //Prost� �ekni, a� jde za tebou. Na ovci je docela chytr�. Starej se o ni dob�e!
		}
		else
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_03"); //Zase? Fajn. Vezmi si Betsy.
			AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_04"); //Betsy? Ale u� ta minul� ovce se jmenovala Betsy.
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_05"); //V�echny ovce se jmenuj� Betsy.
			if (Pepe_SchafGekauft == 3)
			{
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_06"); //Samoz�ejm� krom� beran�.
				AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_07"); //A jak se jmenuj� oni?
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_08"); //Bruce.
			};
		};
		
		Pepe_SchafGekauft = Pepe_SchafGekauft + 1;		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");  // *** FIXME *** noch entsprechenden WP/FP eintragen
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_09"); //Nem� dost zlata. Nem��u ti tu ovci d�t levn�ji.
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pepe_PICKPOCKET (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 900;
	condition	= DIA_Pepe_PICKPOCKET_Condition;
	information	= DIA_Pepe_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Pepe_PICKPOCKET_Condition()
{
	C_Beklauen (15, 25);
};
 
FUNC VOID DIA_Pepe_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pepe_PICKPOCKET);
	Info_AddChoice		(DIA_Pepe_PICKPOCKET, DIALOG_BACK 		,DIA_Pepe_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pepe_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pepe_PICKPOCKET_DoIt);
};

func void DIA_Pepe_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pepe_PICKPOCKET);
};
	
func void DIA_Pepe_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pepe_PICKPOCKET);
};















