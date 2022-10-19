// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_SLD_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_SLD_6_EXIT_Condition;
	information	= DIA_SLD_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_SLD_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_SLD_6_JOIN_Condition;
	information	= DIA_SLD_6_JOIN_Info;
	permanent	= TRUE;
	description = "R�d bych se k v�m p�idal!";
};                       

FUNC INT DIA_SLD_6_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_JOIN_15_00"); //R�d bych se k v�m p�idal!
	
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_01"); //Sly�el jsem o t� z�le�itosti s domobranou. Torlof ��kal, �e jsi pro�el zkou�kou. M� m�j souhlas.
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_02"); //O�kubat farm��e je jedna v�c, ale za��nat si nep��jemnosti s domobranou je v�c druh�. Ale jestli t� Onar bude k n��emu pot�ebovat, nejsem proti.
	}
	else
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_03"); //Promluv si s Torlofem. On u� ti uk�e. (sm�ch)
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_SLD_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_SLD_6_PEOPLE_Condition;
	information	= DIA_SLD_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo tady tomu vel�?";
};                       

FUNC INT DIA_SLD_6_PEOPLE_Condition()
{
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_PEOPLE_15_00"); //Kdo tady tomu vel�?
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_01"); //Ta farma pat�� Onarovi, pokud ses ptal na tohle. Ale vel� tady Lee.
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_02"); //B�val gener�lem kr�lovsk�ho vojska. Ale te� u� se s kr�lem n�jak nekamar�d�. (sm�ch)
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_03"); //Pamatuj si jeho jm�no. Kdy� se tu dostane� do pot��, bude nejsp� t�m jedin�m, kdo to m��e urovnat. V�ichni ostatn� t� jednodu�e st�hnou z k��e.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_SLD_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_SLD_6_LOCATION_Condition;
	information	= DIA_SLD_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Hl�d�te sedl�ky?";
};                       

FUNC INT DIA_SLD_6_LOCATION_Condition()
{
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_LOCATION_15_00"); //Hl�d�te farm��e?
	AI_Output (self, other, "DIA_SLD_6_LOCATION_06_01"); //Nehl�d�me jen Onarovu farmu, ale cel� tohle �dol�.
	AI_Output (self, other, "DIA_SLD_6_LOCATION_06_02"); //Onar chce, abychom dali za vyu�enou ka�d�mu, kdo tu bude d�lat pot�e. Tak si d�vej pozor.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_SLD_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_SLD_6_STANDARD_Condition;
	information	= DIA_SLD_6_STANDARD_Info;
	permanent	= TRUE;
	description = "Jak to jde?";
};                       
func INT DIA_SLD_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_SLD_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_STANDARD_15_00"); //Co se stalo?
		
	if (Kapitel <= 2)
	{
		if (EnterOW_Kapitel2 == FALSE)
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_01"); //Te� jsi jedn�m z n�s, hochu!
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_02"); //Co chce�?
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_03"); //Kdy� jsem to sly�el o t�ch drac�ch, nemohl jsem tomu v�bec uv��it.
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_04"); //Drak - tak tomuhle ��k�m boj. U� ��dn� ovce a natvrdl� domobrana, ale kone�n� opravdov� nep��tel.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_05"); //Fajn, nenad�lal si ten tv�j lord Hagen z t�ch drak� do kalhot?
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_06"); //Tak to vypad�, �e te� bude muset ten sv�j n�bl zadek p�ece jen vyt�hnout z m�sta.
			};
		};	
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_07"); //Lord Hagen m��e mluvit o �t�st�. Je�t� p�r dn� a p�i�li bychom si tam pro Benneta sami.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_08"); //Jestli brzy nepust� Benneta z v�zen�, dojdeme si pro n�j sami.
		};	
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_09"); //Co tady je�t� d�l�? Pro� jsi ne�el s ostatn�mi do �dol�?
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_10"); //Pro m� za m�, nikdo z v�s se u� nemus� vr�tit.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_11"); //M�l by ses vydat do Hornick�ho �dol�. Sly�el jsem, �e ti mizern� bastardi budou pot�ebovat ka�dou pomoc.
		};	
	};
	
	if (Kapitel >= 5)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_12"); //Hned, jak jsi p�i�el, jsem v�d�l, �e to tu obr�t� vzh�ru nohama.
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_13"); //Ale draci? To je n�co jin�ho. Te� se t� jen tak n�kdo napadnout neodv��.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_14"); //P�ekvapils m�. Pat�� ke �patn� stran�, ale zab�t draka je rozhodn� velk� �in.
		};	
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SLD_6 (var c_NPC slf)
{
	DIA_SLD_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
