// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_1_EXIT_Condition;
	information	= DIA_BAU_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_1_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_1_JOIN_Condition;
	information	= DIA_BAU_1_JOIN_Info;
	permanent	= TRUE;
	description = "Ich will mehr über die Söldner wissen.";
};                       

FUNC INT DIA_BAU_1_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_1_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_JOIN_15_00"); //Ich will mehr über die Söldner wissen.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_01"); //Ich kann dir nur raten, einen Bogen um die zu machen.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_02"); //Wenn einem von ihnen dein Gesicht nicht gefällt, kann es sein, dass er dir mal eben eins auf die Nase gibt.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_03"); //Du kannst dich zwar hinterher bei Lee beschweren, aber davon wird deine Nase auch nicht wieder gerade.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_1_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_1_PEOPLE_Condition;
	information	= DIA_BAU_1_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT DIA_BAU_1_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_PEOPLE_15_00"); //Wer hat hier das Sagen?
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_01"); //Das hier ist Onars Hof. Er bestimmt über alles, was hier passiert.
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_02"); //Wenn ich dir einen Tipp geben darf: leg dich nicht mit seinen Söldnern an. Mit den Jungs ist nicht zu spaßen.
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_03"); //Vor allem Sylvio ist ein hinterhältiger Lump. Aber ihr Anführer Lee ist in Ordnung.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_1_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_1_LOCATION_Condition;
	information	= DIA_BAU_1_LOCATION_Info;
	permanent	= TRUE;
	description = "Was gibt es so alles es hier in der Gegend?";
};                       

FUNC INT DIA_BAU_1_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_LOCATION_15_00"); //Was gibt es so alles es hier in der Gegend?
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_01"); //Nur Felder und Höfe. Und jede Menge Söldner. Aber die sind fast alle im Osten auf Onars Hof eben.
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_02"); //Im Norden ist Sekobs Hof, aber da gehen sie nur hin, um Pacht einzutreiben.
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_03"); //Und im Südwesten ist der Aufgang zu Bengars Hof.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_1_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_1_STANDARD_Condition;
	information	= DIA_BAU_1_STANDARD_Info;
	permanent	= TRUE;
	description = "Was gibt's Neues?";
};                       
func INT DIA_BAU_1_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_1_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_STANDARD_15_00"); //Was gibt's Neues?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_01"); //Onar hat Söldner angeheuert, damit sie ihm die Milizen aus der Stadt vom Hals halten. Die würden uns sonst auch noch das letzte Schaf wegholen!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_02"); //Nicht viel. Immer noch dieselben Probleme. Milizen, Orks und Feldräuber.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_03"); //Es geschehen seltsame Dinge hier. Vor einigen Nächten habe ich eine schwarze Gestalt beobachtet. Das war kein Mensch.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_04"); //Man sieht die Orks immer häufiger. Manchmal glaube ich, dass für jeden toten Ork zwei neue auftauchen.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_05"); //Die Paladine gehen ins Minental. Was soll das eigentlich? Dann wird sich die Miliz gar nicht mehr zurückhalten.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_1 (var c_NPC slf)
{
	DIA_BAU_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_1_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_1_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_1_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
