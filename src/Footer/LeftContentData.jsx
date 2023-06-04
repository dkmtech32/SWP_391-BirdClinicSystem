import ArrowForwardIosIcon from '@mui/icons-material/ArrowForwardIos';
import LocationOnIcon from '@mui/icons-material/LocationOn';
import LocalPhoneIcon from '@mui/icons-material/LocalPhone';
import MailIcon from '@mui/icons-material/Mail';
import FacebookIcon from '@mui/icons-material/Facebook';
import TwitterIcon from '@mui/icons-material/Twitter';
import LinkedInIcon from '@mui/icons-material/LinkedIn';
import InstagramIcon from '@mui/icons-material/Instagram';

const LeftContentData = [
  {
    introduction: 'Get In Touch',
    subMenuConTact: [
      {
        imageIcon: <LocationOnIcon />,
        link: '#link',
        content: '123 Street, New York, USA',
      },
      {
        imageIcon: <LocalPhoneIcon />,
        link: '#link',
        content: '+012 345 67890',
      },
      {
        imageIcon: <MailIcon />,
        link: '#link',
        content: 'info@example.com',
      },
    ],
  },
  {
    introduction: 'Popular Links',
    subMenuConTact: [
      {
        imageIcon: <ArrowForwardIosIcon sx={{fontSize: 15}}/>,
        link: '#link',
        content: 'Home',
      },
      {
        imageIcon: <ArrowForwardIosIcon sx={{fontSize: 15}}/>,
        link: '#link',
        content: 'About Us',
      },
      {
        imageIcon: <ArrowForwardIosIcon sx={{fontSize: 15}}/>,
        link: '#link',
        content: 'Our Service',
      },
      {
        imageIcon: <ArrowForwardIosIcon sx={{fontSize: 15}}/>,
        link: '#link',
        content: 'Our Team',
      },
      {
        imageIcon: <ArrowForwardIosIcon sx={{fontSize: 15}}/>,
        link: '#link',
        content: 'Contact Us',
      },
    ],
  },
  {
    introduction: 'Popular Links',
    subMenuConTact: [
      {
        imageIcon: <FacebookIcon />,
        link: '#link',
        content: '',
      },
      {
        imageIcon: <TwitterIcon />,
        link: '#link',
        content: '',
      },
      {
        imageIcon: <LinkedInIcon />,
        link: '#link',
        content: '',
      },
      {
        imageIcon: <InstagramIcon />,
        link: '#link',
        content: '',
      },
    ],
  },
];

export default LeftContentData;