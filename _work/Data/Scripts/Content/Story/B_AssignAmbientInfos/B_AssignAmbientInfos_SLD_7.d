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
	description = "Chc� si� do was przy��czy�!";
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
	AI_Output (other, self, "DIA_SLD_7_JOIN_15_00"); //Chc� si� do was przy��czy�.
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_01"); //S�ysza�em, �e da�e� si� stra�y we znaki. Przyda�by� si� nam.
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_02"); //�ci�ganie czynszu od farmer�w nie jest raczej trudnym zadaniem, ale skoro Onar chce ci za to p�aci�, to ja nie b�d� si� wtr�ca�.
	}
	else
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_03"); //Ty? Niech no tylko Torlof podda ci� pr�bie, a stracisz ten zapa�, mi�czaku.
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
	description = "Kto tu dowodzi?";
};                       

FUNC INT DIA_SLD_7_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_PEOPLE_15_00"); //Kto tu dowodzi?
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_01"); //Naszym szefem jest Lee, a Torlof jego praw� r�k�. Wi�kszo�� ludzi liczy si� z jego zdaniem, poniewa� dowodzi� nimi jeszcze za czas�w kolonii.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_02"); //Jest jeszcze Sylvio. Zjawi� si� tu, wraz z grupk� swoich ludzi, po przybyciu Lee.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_03"); //On i jego banda stanowi� niewielk� cz�� wszystkich najemnik�w - ale sprawiaj� du�o k�opot�w. Ci kolesie prowadz� w�asn� gr�.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_04"); //Sylvio to brudny sukinsyn. Uwa�aj, kiedy go spotkasz.
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
	description = "Powiedz mi co� o farmie.";
};                       

FUNC INT DIA_SLD_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_LOCATION_15_00"); //Powiedz mi co� o farmie.
	AI_Output (self, other, "DIA_SLD_7_LOCATION_07_01"); //Na rozkaz Onara pilnujemy jego w�asno�ci.
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_SLD_7_LOCATION_07_02"); //Nie my�l nawet o tym, �eby co� zw�dzi�, niech ci te� nie przyjdzie do g�owy wdawa� si� w b�jki z ch�opami. No chyba �e chcesz mie� z nami do czynienia, jasne?
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
	description = "Co nowego?";
};                       
func INT DIA_SLD_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_SLD_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_STANDARD_15_00"); //Co s�ycha�?
		
	if (Kapitel <= 2)
	{
		if (EnterOW_Kapitel2 == FALSE)
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_01"); //Od kiedy si� do nas przy��czy�e�, na farmie zapanowa� spok�j - �adnej stra�y.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_02"); //U nas, nic ciekawego. Ale popytaj w mie�cie. Zdaje si�, �e maj� problemy z dostawami �ywno�ci.
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_03"); //W G�rniczej Dolinie rozbestwi�y si� smoki! Nie chcia�bym znale�� si� teraz na miejscu paladyn�w.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_04"); //Domy�lam si�, �e Kr�l porz�dnie skopie ty�ek Lordowi Hagenowi, gdy ten, z powodu smok�w, wr�ci z pustymi r�kami.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_05"); //Czy wy, paladyni, nie mogliby�cie zaj�� si� smokami? Zreszt�, walka to co� dla prawdziwych facet�w.
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
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_06"); //Spos�b, w jaki rozwi�za�e� spraw� Benneta, godny jest pochwa�y. Sylvio pewnie zzielenia� z w�ciek�o�ci. Wola�by chyba najecha� na miasto i roznie�� je w py�.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_07"); //Zawsze pr�buje poni�y� i o�mieszy� Lee, a Bennet dostarczy� mu dobrego pretekstu.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_08"); //Nie wiem, dlaczego pomog�e� Bennetowi, ale uwierz mi, miasto na tym skorzysta.
			};
		}
		else
		{
			if (hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_09"); //Ta sprawa z Bennetem to nic dobrego. Mo�e, mimo wszystko, powinni�my pos�ucha� Sylvia i zaatakowa� miasto.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_10"); //Jakie masz plany w stosunku do Benneta? No c�, w�a�ciwie to wol� nie wiedzie�, sam si� wkr�tce przekonasz, do czego to wszystko prowadzi.
			};
		};		
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_11"); //My�la�em, �e tak jak Sylvio, te� zmierzasz w kierunku doliny.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_12"); //Nikt z nas by nie �a�owa�, gdyby Sylvio zosta� w dolinie. NA ZAWSZE.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_13"); //Masz du�o odwagi, �eby tu si� pokazywa�.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_14"); //Ale nic mnie to nie obchodzi, p�ki nie chcesz �ci�ga� podatk�w.
		};
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_SLD_7_STANDARD_07_15"); //Do diab�a, d�u�ej tego nie znios�. Owce, pastwiska, drzewa. Drzewa, owce i pastwiska. Chc� si� st�d w ko�cu wydosta�.
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
