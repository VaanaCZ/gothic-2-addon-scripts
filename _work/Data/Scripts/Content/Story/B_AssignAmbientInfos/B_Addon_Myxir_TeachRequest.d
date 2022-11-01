///////////////////////////////////////////////////////////////////////
//	Info B_DIA_Addon_Myxir_TeachRequest
///////////////////////////////////////////////////////////////////////
func void B_DIA_Addon_Myxir_TeachRequest ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TeachRequest_15_00"); //Apprenez-moi cette langue.
}; 

func void B_DIA_Addon_Myxir_TeachL1 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_00"); //Nous allons commencer par quelque chose de simple. Pour commencer, je peux vous apprendre la langue des paysans.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_01"); //En règle générale, les textes rédigés dans la langue des paysans traitent de sujets mondains, tels le travail, l'amour ou l'obtention de nourriture.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_02"); //Cette langue était autrefois la langue commune de la ville. Si vous la connaissez, vous serez en mesure de comprendre la plupart des textes que vous pourrez lire sur ces terres.
};

func void B_DIA_Addon_Myxir_TeachL2 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_00"); //Vous connaissez déjà la langue des paysans. La langue des guerriers est quelque peu plus complexe.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_01"); //Les textes rédigés dans la langue des guerriers traitent essentiellement d'armes et de guerre. Vous y trouverez certainement des informations intéressantes.
};

func void B_DIA_Addon_Myxir_TeachL3 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_00"); //La haute langue des prêtres est vraiment plus difficile à comprendre. Toutefois, je vous l'enseignerai avec plaisir.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_01"); //Plus que tout, la langue des prêtres est utilisée dans les écrits sacrés, qui relatent l'histoire et la magie des bâtisseurs.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_02"); //Chacun de ces textes est un véritable trésor, à condition toutefois d'en comprendre le sens.
};

func void B_DIA_Addon_Myxir_TeachNoMore ()
{
	AI_Output 	(self, other,"DIA_Addon_Myxir_TeachNoMore_12_00"); //Je ne peux rien vous apprendre de plus. Vous avez maintenant maîtrisé la langue des bâtisseurs.
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00"); //Allez mettre vos nouvelles connaissances à l'épreuve. Vous verrez par vous-même que les écrits des bâtisseurs n'ont plus aucun mystère pour vous.
};



