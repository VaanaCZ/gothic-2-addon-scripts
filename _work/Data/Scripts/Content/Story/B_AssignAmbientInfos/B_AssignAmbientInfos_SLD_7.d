// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_SLD_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_SLD_7_EXIT_Condition;
	information	= DIA_SLD_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_SLD_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_SLD_7_JOIN_Condition;
	information	= DIA_SLD_7_JOIN_Info;
	permanent	= TRUE;
	description = "R�d bych se k v�m p�idal!";
};                       

FUNC INT DIA_SLD_7_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_7_JOIN_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_JOIN_15_00"); //R�d bych se k v�m p�idal!
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_01"); //Sly�el jsem, �es to nandal domobran�. N�kdo jako ty se n�m tu m��e jen hodit!
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_02"); //Nedok�u si p�edstavit, co je na vyb�r�n� dan� od n�kolika farm��� tak slo�it�ho, ale kdy� si to Onar p�eje, j� nebudu proti.
	}
	else
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_03"); //Ty? Hned jak t� Torlof podrob� zkou�ce, bude� hotovej, ty bimbasi!
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_SLD_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_SLD_7_PEOPLE_Condition;
	information	= DIA_SLD_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo tady tomu vel�?";
};                       

FUNC INT DIA_SLD_7_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_PEOPLE_15_00"); //Kdo tady tomu vel�?
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_01"); //Lee je n� ��f. Torlof je jeho prav� ruka. V�t�ina lid� ho poslouch�, proto�e jim velel je�t� v kolonii.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_02"); //A pak je tu Sylvio. P�i�el z hor potom, co sem dorazil Lee.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_03"); //On se sv�mi lidmi p�edstavuje jen malou skupinku �oldn��� - a d�laj� jen sam� probl�my. Jedou na vlastn� p�st.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_04"); //A Sylvio je mizernej zkurvysyn - dej si na n�j bacha.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_SLD_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_SLD_7_LOCATION_Condition;
	information	= DIA_SLD_7_LOCATION_Info;
	permanent	= TRUE;
	description = "Pov�z mi n�co o tomhle statku.";
};                       

FUNC INT DIA_SLD_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_LOCATION_15_00"); //�ekni mi n�co o farm�.
	AI_Output (self, other, "DIA_SLD_7_LOCATION_07_01"); //Onar si n�s najal, abychom br�nili jeho majetek.
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_SLD_7_LOCATION_07_02"); //Tak si rad�j po��dn� rozmysli, ne� bude� cht�t n�co ukr�st nebo napadnout farm��e. Jinak si to bude� muset nejd��v vy��kat s n�mi.
	};
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_SLD_7_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_SLD_7_STANDARD_Condition;
	information	= DIA_SLD_7_STANDARD_Info;
	permanent	= TRUE;
	description = "Co je nov�ho?";
};                       
func INT DIA_SLD_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_SLD_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_STANDARD_15_00"); //Co je nov�ho?
		
	if (Kapitel <= 2)
	{
		if (EnterOW_Kapitel2 == FALSE)
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_01"); //Od t� doby, co ses k n�m p�idal, je tu klid - ��dn� domobrana.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_02"); //Nic moc, alespo� tady. Ale zeptej se ve m�st�, m�m dojem, �e jim do�el dlabanec. (sm�ch)
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_03"); //Draci v Hornick�m �dol�! Necht�l bych te� b�t v k��i paladin�.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_04"); //H�d�m, �e kr�l lordu Hagenovi asi nakope zadek, kdy� se mu kv�li drak�m vr�t� s pr�zdnejma rukama.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_05"); //Tvoji paladinov� si nev�d� s draky rady? Takov� ka�pa�i - boj je pr�ce pro opravdov� chlapy.
			};
		};	
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			if (hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_06"); //V t� v�ci s Bennetem ses zachoval v�c ne� f�rov�. Sylvio se te� m��e vzteknout. Nejrad�i by vrazil do m�sta a rozml�til to tam na kousky.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_07"); //V�dycky cht�l Leeho zatla�it do kouta, a Bennet se mu v�born� hodil.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_08"); //Nev�m, pro� jsi pomohl Bennetovi, ale v�� mi, �e pro m�sto je to tak lep��.
			};
		}
		else
		{
			if (hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_09"); //Ta v�c s Bennetem je sm�la. Mo�n� jsme p�ece jen m�li Sylvia poslechnout a napadnout m�sto.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_10"); //Co m� v pl�nu s Bennetem? Jasn�, j� to vlastn� rad�i ani nechci v�d�t. U� brzy ti dojde, k �emu to povede.
			};
		};		
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_11"); //M�l jsem dojem, �es m�l taky nam��eno do �dol�. Spole�n� se Sylviem.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_12"); //Nikdo z n�s nechce ani pomyslet na to, �e by Sylvio z�stal v �dol�. Nikdy!
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_13"); //To je od tebe docela odvaha, uk�zat se tady �pln� s�m.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_14"); //Ale dokud se nebude� pokou�et vyb�rat ��dn� dan�, je mi to jedno.
		};
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_SLD_7_STANDARD_07_15"); //Hochu, u� to nem��u d�l vydr�et. Ovce, pastviny a stromy. Chci se odsud dostat.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SLD_7 (var c_NPC slf)
{
	DIA_SLD_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_7_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
