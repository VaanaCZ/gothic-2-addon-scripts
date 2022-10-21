// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OCPAL_4_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OCPAL_4_EXIT_Condition;
	information	= DIA_OCPAL_4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OCPAL_4_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_OCPAL_4_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_OCPAL_4_PEOPLE_Condition;
	information	= DIA_OCPAL_4_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kto tu dowodzi?";
};                       

FUNC INT DIA_OCPAL_4_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_4_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_4_PEOPLE_15_00"); //Kto tu dowodzi?
	AI_Output (self, other, "DIA_OCPAL_4_PEOPLE_04_01"); //Kapitan Garond. Znajdziesz go w najwi�kszym budynku kompleksu zamkowego.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_OCPAL_4_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_OCPAL_4_LOCATION_Condition;
	information	= DIA_OCPAL_4_LOCATION_Info;
	permanent	= TRUE;
	description = "Mo�esz mi co� powiedzie� o G�rniczej Dolinie?";
};                       

FUNC INT DIA_OCPAL_4_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_4_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_4_LOCATION_15_00"); //Mo�esz mi co� powiedzie� o G�rniczej Dolinie?
	AI_Output (self, other, "DIA_OCPAL_4_LOCATION_04_01"); //Z tego, co mi wiadomo, znajduje si� tam kilka kopalni. O ile nie zosta�y spl�drowane przez ork�w.
	AI_Output (self, other, "DIA_OCPAL_4_LOCATION_04_02"); //Oddzia�y tam przebywaj�ce sk�adaj� si� w g��wnej mierze z wi�ni�w, jest te� w�r�d nich kilku paladyn�w.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_OCPAL_4_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_OCPAL_4_STANDARD_Condition;
	information	= DIA_OCPAL_4_STANDARD_Info;
	permanent	= TRUE;
	description = "Jak leci?";
};
                       
func INT DIA_OCPAL_4_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_4_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_4_STANDARD_15_00"); //Jak si� maj� sprawy?
		
	if (Kapitel <= 3)
	{
		AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_01"); //Jeste�my otoczeni przez ork�w! B�dziemy si� jednak broni� do ostatniego cz�owieka! Za� Innos wspomo�e nas sw� pot�g� w walce ze smokami!
	};
	
	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_02"); //Tylko patrze�, jak orkowie zaatakuj�. Gdzie s� te cholerne posi�ki?
			if (other.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_03"); //Nie wierzysz chyba, �e �owcy smok�w poradz� sobie z WSZYSTKIMI bestiami?
			}
			else
			{
				AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_04"); //Ci, tak zwani �owcy smok�w, sami niewiele zdzia�aj�.
			};
		}
		else
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_05"); //Innosowi niech b�d� dzi�ki! Te cholerne bestie w ko�cu zosta�y pokonane.
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_06"); //�mier� smok�w nie zniech�ci�a specjalnie ork�w. Dlaczego, na Innosa, po prostu nie odejd�? Czuj� w tym dzia�anie z�ych mocy.
		}
		else
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_07"); //Przekl�ta brama, kto� j� zablokowa�! Orkowie wlewaj� si� do zamku, nic ich ju� nie powstrzyma.
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_08"); //Kto� musi powiadomi� Lorda Hagena. Potrzebujemy go TUTAJ!
		};
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OCPAL_4 (var c_NPC slf)
{
	DIA_OCPAL_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OCPAL_4_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_OCPAL_4_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_OCPAL_4_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
