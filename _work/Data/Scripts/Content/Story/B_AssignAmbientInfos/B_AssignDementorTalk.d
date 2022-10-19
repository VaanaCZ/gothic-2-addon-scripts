// ************************************************************
// 	     EXIT 
// ************************************************************

INSTANCE DIA_AmbientDementor_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_AmbientDementor_EXIT_Condition;
	information	= DIA_AmbientDementor_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_AmbientDementor_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_AmbientDementor_EXIT_Info()
{	
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos (self);
	B_SCIsObsessed (self);
	Npc_SetRefuseTalk (self,5);	
	Snd_Play 	("MFX_FEAR_CAST" );

	if (	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino1))
		||	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino2))
		||	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino3))
		||	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino4)))
			{
				DMT_Vino1.aivar[AIV_EnemyOverride] = FALSE;
				DMT_Vino2.aivar[AIV_EnemyOverride] = FALSE;
				DMT_Vino3.aivar[AIV_EnemyOverride] = FALSE;
				DMT_Vino4.aivar[AIV_EnemyOverride] = FALSE;
			}
			else
			{
			B_Attack (self, other, AR_SuddenEnemyInferno, 1);
			};
};	
///////////////////////////////////////////////////////////////////////
//	AmbientDementor Info
///////////////////////////////////////////////////////////////////////
instance DIA_AmbientDementor		(C_INFO)
{
	nr		 	= 	1;
	condition	= 	DIA_AmbientDementor_Condition;
	information	= 	DIA_AmbientDementor_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_AmbientDementor_Condition ()
{
	if (Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};	
};

func void DIA_AmbientDementor_Info ()
{
	Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	

		var int randy;
		randy = Hlp_Random (4);
	
		
	if (	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino1))
		||	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino2))
		||	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino3))
		||	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino4)))
		{	
			AI_Output			(self ,other, "DIA_VinoDementor_19_00"); //P�i�el jsi n�s ru�it v ob�adu? Jeho du�e n�le�� n�m. Te� u� ho nezachr�n�, m�gu.
		}
	else if (CurrentLevel == DRAGONISLAND_ZEN)
		{
			if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DragonIsle_Keymaster))
				{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_01"); //(sm�je se) P�i�el jsi, abys po�pinil m� jm�no i mou pr�ci? Ud�lal jsi osudovou chybu.
						AI_Output			(self ,other, "DIA_AmbientDementor_19_02"); //Nikomu se je�t� nepoda�ilo proj�t mou kryptou. M�l by ses vr�tit, proto�e do posv�tn�ch Irdorathsk�ch s�n� se nikdy nedostane�.
				}
				else
				{	
				 	if (randy == 0)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_03"); //U� ji za�el moc daleko, mrzk� �erve. Nikdy se do na�� tajn� svatyn� nedostane�.
					};
					if (randy == 1)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_04"); //Z�sta� st�t, kde jsi. U� ani krok!
					};
					if (randy == 2)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_05"); //Dostal ses daleko, ale p�es m� nep�ejde�.
					};
					if (randy == 3)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_06"); //P�i�el jsi zm��it s�ly s P�nem, ale nejd��ve se mus� dostat p�es m�.
					};
				};	
		}
	else if (hero.guild == GIL_KDF)
		{
		 	if (randy == 0)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_07"); //Ubohej r�dobykouzeln��ku, tv� s�la se nikdy nebude moci m��it s P�novou moc�.
			};
			if (randy == 1)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_08"); //Vybral sis cestu magie, abys n�s mohl porazit. Chytr� tah. Ale ve tv�m pod�n� je stejn� k ni�emu.
			};
			if (randy == 2)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_09"); //Nem��e� n�s zastavit ani jako m�g.
			};
			if (randy == 3)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_10"); //M�j P�n t� zni��. Tv� uboh� komediantsk� kouzla t� nem��ou zachr�nit.
			};
		}
	else
		{	
		 	if (randy == 0)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_11"); //Zachra� se, dokud m��e�. D�l u� nen� �niku.
			};
			if (randy == 1)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_12"); //Te� poc�t� P�novu moc. Nem��e� j� uniknout.
			};
			if (randy == 2)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_13"); //P�n si ��d� tvou hlavu. Te� u� t� nic nezachr�n�.
			};
			if (randy == 3)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_14"); //Chytil ses do pasti a te� nastal �as, abychom t� odstranili z tohoto sv�ta.
			};
		};
};


func void B_AssignDementorTalk (var C_Npc slf)
{	
	if 	(slf.guild == GIL_DMT)
	&&	(slf.npctype == NPCTYPE_AMBIENT)
	{
		DIA_AmbientDementor_EXIT.npc	= Hlp_GetInstanceID(slf);
		DIA_AmbientDementor.npc			= Hlp_GetInstanceID(slf);
	};
};	
